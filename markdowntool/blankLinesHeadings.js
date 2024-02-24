import { data } from "./api";
import { Line } from "./line";

// Insert blank lines before and after: h3, h4, h5 headings.
function blankLinesHeadings(lines) {
  lines.forEach((line, lineNumber) => {
    data.headingTypes.forEach((type) => {
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

export { blankLinesHeadings };
