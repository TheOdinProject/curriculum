function extractHref(link) {
  // https://regexr.com/7v3ci to test this regex
  return link.match(/(?<=href=("|'))[^"']+/)?.[0];
}

function extractLinkText(link) {
  const textStart = link.indexOf(">") + 1;
  const textEnd = link.lastIndexOf("<");
  return link.substring(textStart, textEnd);
}

module.exports = {
  names: ["TOP007", "use-markdown-links"],
  description:
    "Links used to navigate to external content or other landmarks in the page should use markdown links instead of HTML anchor tags.",
  tags: ["links", "html"],
  information: new URL(
    "https://github.com/TheOdinProject/curriculum/blob/main/markdownlint/docs/TOP007.md"
  ),
  function: function TOP007(params, onError) {
    const fencesLineRanges = params.tokens
      .filter((token) => token.type === "fence")
      .map((token) => token.map);

    const codepenLineRanges = params.lines.reduce((lineRanges, currentLine, index) => {
      const range = [];
      const lineNumber = index + 1;
      if (currentLine.includes('class="codepen"')) {
        range.push(lineNumber);
        lineRanges.push(range);
      } else if (currentLine.trim().startsWith("</p>")) {
        lineRanges.at(-1).push(lineNumber);
      }

      return lineRanges;
    }, []);

    const isWithinIgnoredLineRange = (lineNumber) => {
      return [...fencesLineRanges, ...codepenLineRanges].some(
        (range) => range[0] < lineNumber && lineNumber < range[1]
      );
    };

    const anchorsToFlag = params.lines.reduce((anchors, currentLine, index) => {
      if (
        isWithinIgnoredLineRange(index) ||
        !currentLine.includes("<a ") ||
        !currentLine.includes("</a>")
      ) {
        return anchors;
      }

      // https://regexr.com/7v3bb to test this regex
      const anchorsWithHrefRegex = /(?<!`)<a\s[^>]*href=[^>]+>.+?<\/a>(?!`)/g;
      const anchorsInCurrentLine = currentLine.match(anchorsWithHrefRegex);

      anchorsInCurrentLine?.forEach((anchor) => {
        anchors.push({
          original: anchor,
          href: extractHref(anchor),
          text: extractLinkText(anchor),
          length: anchor.length,
          lineNumber: index + 1,
          columnNumber: currentLine.indexOf(anchor) + 1,
        });
      });

      return anchors;
    }, []);

    anchorsToFlag.forEach((anchor) => {
      const replacementText = `[${anchor.text}](${anchor.href})`;

      onError({
        lineNumber: anchor.lineNumber,
        detail: `\n  Expected: "${replacementText}"\n  Actual: "${anchor.original}"\n`,
        fixInfo: {
          lineNumber: anchor.lineNumber,
          editColumn: anchor.columnNumber,
          deleteCount: anchor.length,
          insertText: replacementText,
        },
      });
    });
  },
};
