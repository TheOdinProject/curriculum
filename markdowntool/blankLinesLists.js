const { Line } = require("./line");

// Add blank lines above and below lists
function blankLinesLists(lines) {
  let listArray = [];
  const newLines = [];
  lines.forEach((line) => {
    if (
      line.content.startsWith('- ')
    ) {
      listArray.push(line);
    } else if (
      line.content.startsWith('1. ')
    ) {
      listArray.push(line);
    } else {
      if (listArray.length !== 0) {
        newLines.push(new Line());
        listArray.forEach((line) => {
          newLines.push(line);
        });
        newLines.push(new Line());
      }
      newLines.push(line);

      listArray = [];
    }
  });
  return newLines;
}

module.exports = { blankLinesLists };
