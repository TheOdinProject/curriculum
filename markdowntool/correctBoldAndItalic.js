function boldAndItalic(lines) {
  const arrayToExamine = [];

  let marker = false;
  lines.forEach((line) => {
    if (!marker) {
      if (!line.content.includes("`")) {
        arrayToExamine.push(line);
      }
    }
    if (line.content.includes("```" && marker)) {
      marker = false;
    }
    if (line.content.includes("```")) {
      marker = true;
    }
  });

  arrayToExamine.forEach((line) => {
    line.content = line.content
      .split("")
      .map((char) => {
        if (char === "_") {
          return "*";
        }
        return char;
      })
      .join("");
  });

  return lines;
}

module.exports = { boldAndItalic };
