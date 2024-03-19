const { Line } = require("./line");
const fs = require("fs/promises");

async function lessonIntoArrayOfLines(lesson) {
  try {
    const data = await fs.readFile(lesson, "utf8");
    return data.split(`\n`).map((line) => new Line(line));
  } catch (err) {
    console.error(err);
  }
}

module.exports = { lessonIntoArrayOfLines };
