function correctUnorderedList(lines) {
  lines.forEach((line) => {
    if (line.content.trim().startsWith("* ")) {
      const index = line.content.indexOf("*");
      const splitLine = line.content.split("");
      splitLine[index] = "-";
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

module.exports = { correctUnorderedList };
