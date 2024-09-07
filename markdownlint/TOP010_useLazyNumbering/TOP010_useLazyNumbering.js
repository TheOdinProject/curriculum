module.exports = {
  names: ["TOP010", "lazy-numbering-for-ordered-lists"],
  description: "Ordered lists must always use 1. as a prefix (lazy numbering)",
  information: new URL(
    "https://github.com/TheOdinProject/curriculum/blob/main/markdownlint/docs/TOP010.md"
  ),
  tags: ["ol"],
  parser: "markdownit",
  function: function TOP010(params, onError) {
    params.parsers.markdownit.tokens.forEach((token) => {
      // https://regexr.com/80oan to test this regex
      const digit = /^\s*\d+/;
      if (
        token.tag === "li" && 
        digit.test(token.line) && 
        token.info !== "1"
      ) {
        const lineNumber = token.lineNumber;
        const tokenLine = token.line.split(".");
        const lazyNumbering = tokenLine[0].replace(/\d+/, "1");

        onError({
          lineNumber: lineNumber,
          detail: `\n  Expected: "${lazyNumbering}"\n  Actual: "${tokenLine[0]}"\n`,
          fixInfo: {
            lineNumber: lineNumber,
            deleteCount: tokenLine[0].length,
            insertText: lazyNumbering,
          },
        });
      }
    });
  },
};
