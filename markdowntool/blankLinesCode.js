const { Line } = require("./line");

// Add blank lines above and below code blocks
function blankLinesCode(lines) {
  const abovesAndBelows = [];
  let lastIndex = null;
  lines.forEach((line, index) => {
    if (line.content.trim().startsWith('```')) {
      if (lastIndex !== null) {
        abovesAndBelows.unshift(lines[index + 1], lines[lastIndex]);
        lastIndex = null;
      } else {
        lastIndex = index;
      }
    }
  });
  abovesAndBelows.forEach((line) => {
    const index = lines.indexOf(line);
    lines.splice(index, 0, new Line());
  });
  return lines;
}

module.exports = { blankLinesCode };
