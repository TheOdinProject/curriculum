module.exports = {
  names: ["TOP011", "note-box-heading-level"],
  description: "Note box headings must be level 4 (####)",
  information: new URL(
    "https://github.com/TheOdinProject/curriculum/blob/main/markdownlint/docs/TOP011.md"
  ),
  tags: ["headings"],
  parser: "markdownit",
  function: function TOP011(params, onError) {
    const noteBoxHeadings = params.parsers.markdownit.tokens.filter((token, index, tokens) => {
      const previousToken = tokens[index - 1];

      const isFollowingNoteBoxOpening =
        previousToken?.line?.startsWith("<div ") && previousToken.line.includes("lesson-note");
      return token.type === "heading_open" && isFollowingNoteBoxOpening;
    });

    noteBoxHeadings.forEach((heading) => {
      const headingHashes = heading.markup;
      if (headingHashes.length === 4) {
        return;
      }

      const headingText = heading.line.slice(headingHashes.length + 1);
      onError({
        lineNumber: heading.lineNumber,
        detail: `\n  Expected: #### ${headingText}\n  Actual: ${headingHashes} ${headingText}\n`,
        fixInfo: {
          editColumn: 1,
          deleteCount: headingHashes.length,
          insertText: "####",
        },
      });
    });
  },
};
