module.exports = {
  names: ["MD101", "descriptive-link-text"],
  description: "Links have descriptive text labels",
  tags: ["accessibility", "links"],
  function: function MD101(params, onError) {
    const linesWithLinks = params.parsers.markdownit.tokens?.filter((token) =>
      /\[.+?\]\(.+?\)/.test(token.content)
    );
    const linkOpenTokens = linesWithLinks
      .map((line) =>
        line.children?.filter((child) => child.type === "link_open")
      )
      .flat();

    linkOpenTokens.forEach((token) => {
      const { line } = token;
      const isInvalid = /\[(.+\s*)?(this|here)(\s*.+)?\]/i.test(line);
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
