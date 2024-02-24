function boldAndItalic(lines) {
  const arrayToExamine = [];

  let marker = true;
  lines.forEach((line) => {
    if (line.content.trim().startsWith("```")) {
      marker = !marker;
    }
    if (
      !line.content.includes("`") &&
      marker &&
      !line.content.includes("http")
    ) {
      arrayToExamine.push(line);
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
