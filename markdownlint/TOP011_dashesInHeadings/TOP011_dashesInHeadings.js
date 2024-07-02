module.exports = {
  names: ["TOP011", "dashes-in-headings"],
  description:
    "Headings must use a colon (:) instead of dashes (-) for the purpose of separating parts of the heading (hyphenated words are allowed).",
  information: new URL(
    "https://github.com/TheOdinProject/curriculum/blob/main/markdownlint/docs/TOP011.md"
  ),
  tags: ["headings"],
  parser: "markdownit",
  function: function TOP011(params, onError) {
    const headings = params.parsers.markdownit.tokens.filter(
      (token) => token.type === "heading_open"
    );

    // https://regexr.com/82ci6 to test this regex
    const separatorDashRegex = /\s-+\s/;

    headings.forEach((heading) => {
      const separatorDash = heading.line.match(separatorDashRegex)?.[0];
      if (separatorDash) {
        onError({
          lineNumber: heading.lineNumber,
          detail: `\n Expected: ${heading.line.replace(separatorDash, ": ")}\n Actual: ${
            heading.line
          }\n`,
          fixInfo: {
            editColumn: heading.line.indexOf(separatorDash) + 1,
            deleteCount: separatorDash.length,
            insertText: ": ",
          },
        });
      }
    });
  },
};
