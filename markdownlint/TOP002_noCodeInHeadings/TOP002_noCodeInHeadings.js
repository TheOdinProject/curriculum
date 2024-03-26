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

    headingsWithCode.forEach((heading) => {
      const codeContent = heading.line.match(/`.+?`/);

      onError({
        lineNumber: heading.lineNumber,
        detail: `Headings should not contain inline code.`,
        fixInfo: {
          lineNumber: heading.lineNumber,
          editColumn: codeContent.index + 1,
          deleteCount: codeContent[0].length,
          insertText: codeContent[0].replace(/`/g, ""),
        },
      });
    });
  },
};
