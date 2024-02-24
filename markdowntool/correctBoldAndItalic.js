function boldAndItalic(lines) {
  lines.forEach((line) => {
    line.content = line.content
      .split("")
      .map((char) => {
        if (char === "_") {
          return "*";
        } else {
          return char;
        }
      })
      .join("");
  });
  return lines;
}

module.exports = { boldAndItalic };
