const LANGUAGES_WITH_ABBREVIATIONS = new Map()
  .set("js", "javascript")
  .set("rb", "ruby")
  .set("txt", "text")
  .set("md", "markdown");

module.exports = {
  names: ["TOP006", "full-fenced-code-language"],
  description:
    "Fenced code blocks must use the full name for a language if both full and abbreviated options are valid.",
  tags: ["code", "language"],
  information: new URL(
    "https://github.com/TheOdinProject/curriculum/blob/main/markdownlint/docs/TOP006.md"
  ),
  function: function TOP006(params, onError) {
    const fencesWithAbbreviatedName = params.tokens
      .filter((token) => {
        return token.type === "fence" && LANGUAGES_WITH_ABBREVIATIONS.has(token.info);
      })
      .map((token) => ({
        abbreviatedName: token.info,
        fullName: LANGUAGES_WITH_ABBREVIATIONS.get(token.info),
        lineNumber: token.lineNumber,
      }));

    fencesWithAbbreviatedName.forEach((fence) => {
      onError({
        lineNumber: fence.lineNumber,
        detail: `Expected: ${fence.fullName}; Actual: ${fence.abbreviatedName} `,
        context: `\`\`\`${fence.abbreviatedName}`,
      });
    });
  },
};
