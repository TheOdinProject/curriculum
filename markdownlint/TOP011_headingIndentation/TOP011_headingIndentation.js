function isNoteBoxOpenTag(token) {
  return token?.type === "html_block" && token?.content.includes("lesson-note");
}

function categoriseHeadings(headingTypes, currentToken, index, tokens) {
  if (currentToken.type !== "heading_open") {
    return headingTypes;
  }

  const previousToken = tokens[index - 1];
  if (isNoteBoxOpenTag(previousToken)) {
    headingTypes.noteBoxHeadings.push({
      ...currentToken,
      noteBoxLine: previousToken.line,
    });
  } else {
    headingTypes.normalHeadings.push(currentToken);
  }
  return headingTypes;
}

function countLeadingSpaces(str) {
  // https://regexr.com/8g1j2 to test this regex
  return str.search(/[^ ]/);
}

module.exports = {
  names: ["TOP011", "heading-indentation"],
  description: "Headings must not be indented unless they are for a note box.",
  information: new URL(
    "https://github.com/TheOdinProject/curriculum/blob/main/markdownlint/docs/TOP011.md",
  ),
  tags: ["headings", "indentation"],
  parser: "markdownit",
  function: function TOP011(params, onError) {
    const { tokens } = params.parsers.markdownit;
    const headings = tokens.reduce(categoriseHeadings, {
      noteBoxHeadings: [],
      normalHeadings: [],
    });

    headings.noteBoxHeadings.forEach((heading) => {
      const headingIndentation = countLeadingSpaces(heading.line);
      const noteBoxIndentation = countLeadingSpaces(heading.noteBoxLine);

      if (headingIndentation !== noteBoxIndentation) {
        onError({
          lineNumber: heading.lineNumber,
          detail: `Note box heading indented ${headingIndentation} spaces but should be indented ${noteBoxIndentation} spaces instead to match the containing note box.`,
          context: heading.line,
          fixInfo: {
            lineNumber: heading.lineNumber,
            deleteCount: headingIndentation,
            insertText: " ".repeat(noteBoxIndentation),
          },
        });
      }
    });

    headings.normalHeadings.forEach((heading) => {
      const headingIndentation = countLeadingSpaces(heading.line);
      if (headingIndentation) {
        onError({
          lineNumber: heading.lineNumber,
          detail: `Normal headings must not be indented.`,
          context: heading.line,
          fixInfo: {
            lineNumber: heading.lineNumber,
            deleteCount: headingIndentation,
          },
        });
      }
    });
  },
};
