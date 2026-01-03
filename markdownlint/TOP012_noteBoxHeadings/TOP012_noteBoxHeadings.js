function isNoteBoxOpenTag(token) {
  return token?.type === "html_block" && token?.content.includes("lesson-note");
}

function lacksHeading(token, index, tokens) {
  return isNoteBoxOpenTag(token) && tokens[index + 1]?.type !== "heading_open";
}

function getNoteBoxHeadings(headings, currentToken, index, tokens) {
  const previousToken = tokens[index - 1];
  if (
    currentToken.type !== "heading_open" ||
    !isNoteBoxOpenTag(previousToken)
  ) {
    return headings;
  }

  headings.push({
    text: currentToken.line,
    hashes: currentToken.markup,
    lineNumber: currentToken.lineNumber,
  });
  return headings;
}

module.exports = {
  names: ["TOP012", "note-box-headings"],
  description: "Note boxes have appropriate headings",
  information: new URL(
    "https://github.com/TheOdinProject/curriculum/blob/main/markdownlint/docs/TOP012.md",
  ),
  tags: ["headings"],
  parser: "markdownit",
  function: function TOP012(params, onError) {
    const { tokens } = params.parsers.markdownit;
    const noteBoxesWithoutHeadings = tokens.filter(lacksHeading);
    const noteBoxHeadings = tokens.reduce(getNoteBoxHeadings, []);

    noteBoxesWithoutHeadings.forEach((noteBox) => {
      onError({
        lineNumber: noteBox.lineNumber,
        detail:
          "Note box is missing a heading. Note boxes must start with a level 4 heading (####).",
      });
    });

    noteBoxHeadings.forEach((heading) => {
      if (heading.hashes.length === 4) {
        return;
      }

      const hashesStartColumn = heading.text.indexOf(heading.hashes) + 1;

      onError({
        lineNumber: heading.lineNumber,
        detail: `Expected a level 4 heading (####) but got a level ${heading.hashes.length} heading (${heading.hashes}) instead.`,
        context: heading.text,
        fixInfo: {
          editColumn: hashesStartColumn,
          deleteCount: heading.hashes.length,
          insertText: "####",
        },
      });
    });
  },
};
