function correctUnorderedList(lines) {
  lines.forEach((line) => {
    if (line.content.trim().startsWith("* ")) {
      const index = line.content.indexOf("*");
      const splitLine = line.content.split("");
      splitLine[index] = "-";
      line.content = splitLine.join("");
    }
  });
  return lines;
}

module.exports = { correctUnorderedList };
