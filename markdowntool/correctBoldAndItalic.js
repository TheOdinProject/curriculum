function boldAndItalic(lines) {
  const arrayToExamine = [];

  let marker = true;
  lines.forEach((line) => {
    if (line.content.includes("```" && !marker)) {
      marker = true;
    }
    if (line.content.includes("```" && marker)) {
      marker = false;
    }
    if (
      !line.content.includes("`") &&
      marker &&
      !line.content.includes("http")
    ) {
      arrayToExamine.push(line);
    }
  });

  console.log(arrayToExamine);

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
