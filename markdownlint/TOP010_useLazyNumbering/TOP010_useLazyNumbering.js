module.exports = {
  names: ["TOP010", "ordered-list-for-lazy-numbering"],
  description: "Ordered lists should use lazy numbering",
  information: new URL(
    "https://github.com/TheOdinProject/curriculum/blob/main/markdownlint/docs/TOP010.md"
  ),
  tags: ["lazy-numbering"],
  parser: "markdownit",
  function: function TOP010(params, onError) {
    params.parsers.markdownit.tokens.forEach((token) => {
      if (token.tag === "li" && token.line !== undefined) {
        console.log(token);
        const originalText = token.line;
        // https://regexr.com/80oan to test this regex
        const updatedText = originalText.replace(/^\s*\d+\./, (match) =>
          match.replace(/\d+/, "1")
        );
        const textLength = token.line.length;
        const lineNumber = token.lineNumber;

        onError({
          lineNumber: lineNumber,
          detail: `\n  Expected: "${updatedText}"\n  Actual: "${originalText}"\n`,
          fixInfo: {
            lineNumber: lineNumber,
            deleteCount: textLength,
            insertText: updatedText,
          },
        });
      }
    });
  },
};
