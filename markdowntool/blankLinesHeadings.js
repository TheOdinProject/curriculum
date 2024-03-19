const { Line } = require("./line");

// Insert blank lines before and after: h3, h4, h5 headings.
function blankLinesHeadings(lines) {
  const headingTypes = ['###', '####', '#####'];
  lines.forEach((line, lineNumber) => {
    headingTypes.forEach((type) => {
      if (line.content !== undefined && line.content.startsWith(type)) {
        const below = lines[lineNumber + 1];
        const above = lines[lineNumber - 1];
        if (lineNumber - 1 !== -1 && above.content.trim().length !== 0) {
          lines.splice(lineNumber - 1, 0, new Line());
        }
        if (
          lineNumber + 1 !== lines.length &&
          below.content.trim().length !== 0
        ) {
          lines.splice(lineNumber + 1, 0, new Line());
        }
      }
    });
  });
  return lines;
}

module.exports = { blankLinesHeadings };
