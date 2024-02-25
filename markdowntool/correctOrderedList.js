// Make ordered like like 1, 1, 1 instead of 1, 2, 3
function correctOrderedList(lines) {
  lines.forEach((line) => {
    if (
      Number.isInteger(+line.content.trim()[0]) &&
      line.content.trim()[1] === "." &&
      line.content.trim()[2] === " "
    ) {
      // The '. ' is for extra safety to increase the odds of only targeting lists and not just random numbers that happened to be the first number in a string
      const index = line.content.length - line.content.trim().length;
      const splitLine = line.content.split("");
      splitLine[index] = "1"; // This is the line where 2, 3 gets replaced with 1, 1 etc.
      line.content = splitLine.join("");
      const lengthOfLine = line.content.length;
      const lengthOfTrimmedLine = line.content.trimStart().length;
      if (lengthOfLine - lengthOfTrimmedLine <= 2) {
        line.content = line.content.trimStart();
      }
    }
  });
  return lines;
}

module.exports = { correctOrderedList };
