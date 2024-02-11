module.exports = {
  names: ["TOP002", "no-code-headings"],
  description: "No inline code in headings",
  tags: ["headings"],
  function: function TOP002(params, onError) {
    const headingsWithCode = params.parsers.markdownit.tokens?.filter(
      (token, currIndex, tokenArray) =>
        tokenArray[currIndex - 1]?.type === "heading_open" &&
        token.children?.some((child) => child.type === "code_inline")
    );

    headingsWithCode.forEach((heading) => {
      onError({
        lineNumber: heading.lineNumber,
        detail: `Headings should not contain inline code.`,
      });
    });
  },
};
