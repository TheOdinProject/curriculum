const LANGUAGES_WITH_ABBREVIATIONS = new Map()
  .set("js", "javascript")
  .set("rb", "ruby")
  .set("txt", "text")
  .set("md", "markdown")
  .set("sh", "bash")
  .set("yml", "yaml");

module.exports = {
  names: ["TOP006", "full-fenced-code-language"],
  description:
    "Fenced code blocks must use the full name for a language if both full and abbreviated options are valid.",
  tags: ["code", "language"],
  information: new URL(
    "https://github.com/TheOdinProject/curriculum/blob/main/markdownlint/docs/TOP006.md"
  ),
  function: function TOP006(params, onError) {
    const fencesWithAbbreviatedName = params.lines.reduce((fences, currentLine, index) => {
      // https://regexr.com/7v119 to test the following regex:
      const fenceWithLanguageRegex = /^[`~]{3,4}[^`~]+$/;
      if (!fenceWithLanguageRegex.test(currentLine.trim())) {
        return fences;
      }

      const fenceDelimiter = currentLine.trim()[0];
      const delimiterEndColumn = currentLine.lastIndexOf(fenceDelimiter) + 1;
      const language = currentLine.substring(delimiterEndColumn);

      if (LANGUAGES_WITH_ABBREVIATIONS.has(language)) {
        fences.push({
          text: currentLine,
          languageStartingColumn: delimiterEndColumn + 1,
          abbreviatedName: language,
          fullName: LANGUAGES_WITH_ABBREVIATIONS.get(language),
          lineNumber: index + 1,
        });
      }
      return fences;
    }, []);

    fencesWithAbbreviatedName.forEach((fence) => {
      onError({
        lineNumber: fence.lineNumber,
        detail: `Expected: ${fence.fullName}; Actual: ${fence.abbreviatedName} `,
        context: fence.text,
        fixInfo: {
          editColumn: fence.languageStartingColumn,
          deleteCount: fence.abbreviatedName.length,
          insertText: fence.fullName,
        },
      });
    });
  },
};
