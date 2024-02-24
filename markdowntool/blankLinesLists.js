import { data } from "./api";
import { Line } from "./line";

// Add blank lines above and below lists
function blankLinesLists(lines) {
  let listArray = [];
  const newLines = [];
  lines.forEach((line) => {
    if (
      line.content.startsWith(
        data.unorderedListFormat[0].concat(data.unorderedListFormat[1])
      )
    ) {
      listArray.push(line);
    } else if (
      line.content.startsWith(
        data.orderedListFormat[0].concat(
          data.orderedListFormat[1],
          data.orderedListFormat[2]
        )
      )
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

export { blankLinesLists };
