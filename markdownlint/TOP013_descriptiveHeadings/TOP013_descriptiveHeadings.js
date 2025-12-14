const BLACKLISTED_HEADINGS = [
  "note",
  "notes",
  "a note",
  "tip",
  "tips",
  "a tip",
  "warning",
  "warnings",
  "a warning",
  "reminder",
  "reminders",
  "a reminder",
  "important",
  "important note",
  "important tip",
  "important warning",
  "important reminder",
  "info",
  "information",
  "critical",
  "danger",
  "remember",
];

function getHeadingTextStartIndex(text) {
  // https://regexr.com/8gs8i to test this regex
  return text.search(/[^ #]/);
}

function removeTrailingPunctuation(text) {
  // https://regexr.com/8grso to test this regex
  return text.replaceAll(/\W+$/g, "");
}

module.exports = {
  names: ["TOP013", "descriptive-headings"],
  description: "Headings must have descriptive text",
  information: new URL(
    "https://github.com/TheOdinProject/curriculum/blob/main/markdownlint/docs/TOP013.md",
  ),
  tags: ["accessibility", "headings"],
  parser: "markdownit",
  function: function TOP013(params, onError) {
    const { tokens } = params.parsers.markdownit;

    tokens.forEach((token) => {
      if (token.type !== "heading_open") {
        return;
      }

      const headingTextStartIndex = getHeadingTextStartIndex(token.line);
      const headingText = removeTrailingPunctuation(
        token.line.slice(headingTextStartIndex),
      );

      if (BLACKLISTED_HEADINGS.includes(headingText.toLowerCase())) {
        onError({
          lineNumber: token.lineNumber,
          detail: `"${headingText}" is not sufficiently descriptive by itself. Use a more descriptive heading that briefly but clearly summarizes the content of the section.`,
          context: token.line,
        });
      }
    });
  },
};
