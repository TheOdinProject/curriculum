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
    line: currentToken.line,
    markup: currentToken.markup,
    lineNumber: currentToken.lineNumber,
  });
  return headings;
}

function getAssignmentPanelLineRange(lines) {
  // line numbers in file are 1-indexed
  const assignmentStart =
    lines.findIndex((line) => line.includes("lesson-content__panel")) + 1;
  if (!assignmentStart) {
    return [0, 0];
  }

  let assignmentEnd;

  let additionalDivTags = 0;
  for (let i = assignmentStart - 1; i < lines.length; i++) {
    if (lines[i].trim().startsWith("<div")) {
      additionalDivTags++;
    } else if (lines[i].endsWith("</div>")) {
      additionalDivTags--;
    }

    if (!additionalDivTags) {
      // line numbers in file are 1-indexed
      assignmentEnd = i + 1;
      break;
    }
  }

  return [assignmentStart, assignmentEnd];
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
    const [assignmentStart, assignmentEnd] = getAssignmentPanelLineRange(
      params.lines,
    );

    const noteBoxesWithoutHeadings = tokens.filter(lacksHeading);
    const noteBoxHeadings = tokens.reduce(getNoteBoxHeadings, []);
    const assignmentHeadings = tokens
      .filter(
        ({ type, lineNumber }) =>
          type === "heading_open" &&
          lineNumber > assignmentStart &&
          lineNumber < assignmentEnd,
      )
      .filter(
        ({ lineNumber }) =>
          !noteBoxHeadings.find((heading) => lineNumber === heading.lineNumber),
      );

    noteBoxesWithoutHeadings.forEach((noteBox) => {
      onError({
        lineNumber: noteBox.lineNumber,
        detail:
          "Note box is missing a heading. Note boxes must start with a level 4 heading (####).",
      });
    });

    [...noteBoxHeadings, ...assignmentHeadings].forEach((heading) => {
      if (heading.markup.length === 4) {
        return;
      }

      const hashesStartColumn = heading.line.indexOf(heading.markup) + 1;

      onError({
        lineNumber: heading.lineNumber,
        detail: `Expected a level 4 heading (####) but got a level ${heading.markup.length} heading (${heading.markup}) instead.`,
        context: heading.line,
        fixInfo: {
          editColumn: hashesStartColumn,
          deleteCount: heading.markup.length,
          insertText: "####",
        },
      });
    });
  },
};
