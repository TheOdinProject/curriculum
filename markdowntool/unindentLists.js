function unindentLists(lines) {
  lines.forEach((line) => {
    if (
      line.content.trimStart().startsWith("- ") ||
      line.content.trimStart().startsWith("1. ")
    ) {
      const lengthOfLine = line.content.length;
      const lengthOfTrimmedLine = line.content.trimStart().length;
      if (lengthOfLine - lengthOfTrimmedLine === 1) {
        line.content = line.content.trimStart();
      }
    }
  });
  return lines;
}

module.exports = { unindentLists };
