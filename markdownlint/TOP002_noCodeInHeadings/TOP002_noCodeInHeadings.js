module.exports = {
  names: ["TOP002", "no-code-headings"],
  description: "No inline code in headings",
  tags: ["headings"],
  information: new URL(
    "https://github.com/TheOdinProject/curriculum/blob/main/markdownlint/docs/TOP002.md"
  ),
  function: function TOP002(params, onError) {
    const headingsWithCode = params.parsers.markdownit.tokens?.filter(
      (token, currIndex, tokenArray) =>
        tokenArray[currIndex - 1]?.type === "heading_open" &&
        token.children?.some((child) => child.type === "code_inline")
    );

    const codeContent = [];
    headingsWithCode.forEach((heading) => {
      // https://regexr.com/7uk28 to test the following regex
      const codeMatches = heading.line.match(/`.+?`/g);
      const codeContentDetails = codeMatches.map((codeMatch) => {
        const index = heading.line.indexOf(codeMatch);

        return { text: codeMatch, index, lineNumber: heading.lineNumber };
      });
      codeContent.push(...codeContentDetails);
    });

    codeContent.forEach((content) => {
      onError({
        lineNumber: content.lineNumber,
        detail: `Headings should not contain inline code.`,
        context: content.text,
        fixInfo: {
          lineNumber: content.lineNumber,
          editColumn: content.index + 1,
          deleteCount: content.text.length,
          insertText: content.text.replaceAll("`", ""),
        },
      });
    });
  },
};
