module.exports = {
  names: ["TOP001", "descriptive-link-text"],
  description: "Links have descriptive text labels",
  tags: ["accessibility", "links"],
  function: function TOP001(params, onError) {
    const linesWithLinks = params.parsers.markdownit.tokens?.filter((token) =>
      // https://regexr.com/7rf16 to test the following regex
      /(?<!\!)\[.+?\]\(.+?\)/.test(token.content)
    );
    const linkOpenTokens = linesWithLinks
      .map((line) =>
        line.children?.filter((child) => child.type === "link_open")
      )
      .flat();

    linkOpenTokens.forEach((token) => {
      if (!token?.line) {
        return;
      }
      const { line } = token;
      // https://regexr.com/7rf1l to test the following regex
      const isInvalid = /\[.*?(?<!\w)(this|here)(?!\w).*?\]/i.test(line);
      if (isInvalid) {
        const linkUrl = token.attrs[0][1];
        const indexOfUrl = line.indexOf(linkUrl);
        const upToIndexOfUrl = line.slice(0, indexOfUrl);
        const openingBracketIndex = upToIndexOfUrl.lastIndexOf("[");

        onError({
          lineNumber: token.lineNumber,
          detail: `Links must have a descriptive text label.`,
          context: `${line.slice(
            openingBracketIndex,
            indexOfUrl + linkUrl.length + 1
          )}`,
        });
      }
    });
  },
};
