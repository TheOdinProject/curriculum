function capitalize(text) {
  return `${text[0].toUpperCase()}${text.substring(1)}`;
}

function isNoteBoxOpenTag(token) {
  return token?.type === "html_block" && token?.content.includes("lesson-note");
}

function lacksHeading(token, index, tokens) {
  return isNoteBoxOpenTag(token) && tokens[index + 1]?.type !== "heading_open";
}

function categoriseHeadingsByNoteBoxType(
  headings,
  currentToken,
  index,
  tokens
) {
  const previousToken = tokens[index - 1];
  if (
    currentToken.type !== "heading_open" ||
    !isNoteBoxOpenTag(previousToken)
  ) {
    return headings;
  }

  // https://regexr.com/86jmp to test the regex below
  const noteBoxType = capitalize(
    previousToken.content.match(/(?<=lesson-note--).+?(?=\W)/)?.[0] ?? "note"
  );

  headings[noteBoxType].push({
    text: currentToken.line,
    hashes: currentToken.markup,
    lineNumber: currentToken.lineNumber,
  });
  return headings;
}

module.exports = {
  names: ["TOP011", "note-box-headings"],
  description: "Note boxes have appropriate headings",
  information: new URL(
    "https://github.com/TheOdinProject/curriculum/blob/main/markdownlint/docs/TOP011.md"
  ),
  tags: ["headings"],
  parser: "markdownit",
  function: function TOP011(params, onError) {
    const { tokens } = params.parsers.markdownit;
    // console.log(tokens);
    const noteBoxesWithoutHeadings = tokens.filter(lacksHeading);
    const noteBoxHeadings = tokens.reduce(categoriseHeadingsByNoteBoxType, {
      Note: [],
      Tip: [],
      Warning: [],
      Critical: [],
    });

    noteBoxesWithoutHeadings.forEach((noteBox) => {
      onError({
        lineNumber: noteBox.lineNumber,
        detail:
          "Note box is missing a heading. Note boxes must start with a level 4 heading (####).",
      });
    });

    Object.entries(noteBoxHeadings).forEach(([noteBoxType, headings]) => {
      headings.forEach(({ text, hashes, lineNumber }) => {
        if (text.trim().startsWith(`#### ${capitalize(noteBoxType)}:`)) {
          return;
      }

        const leadingSpaces = text.indexOf(hashes);
        const firstWordIndex = leadingSpaces.length + hashes.length + 1;
        const firstWord = text.slice(firstWordIndex, text.indexOf(":"));
        const baseErrorInfo = {
          lineNumber: lineNumber,
          context: text,
        };

        if (firstWord !== noteBoxType) {
          onError({
            ...baseErrorInfo,
            detail: `${noteBoxType} box heading text must start with "${noteBoxType}:"`,
          });
        }
        if (hashes.length !== 4) {
          onError({
            ...baseErrorInfo,
            detail: `Expected a level 4 heading (####) but got a level ${hashes.length} heading (${hashes}) instead.`,
            fixInfo: {
              editColumn: leadingSpaces + 1,
              deleteCount: hashes.length,
              insertText: "####",
            },
          });
        }
      });
    });
  },
};
