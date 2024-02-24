import { Line } from "./line";
import fs from "fs/promises";

async function lessonIntoArrayOfLines(lesson) {
  try {
    const data = await fs.readFile(lesson, "utf8");
    return data.split(`\n`).map((line) => new Line(line));
  } catch (err) {
    console.error(err);
  }
}

export { lessonIntoArrayOfLines };
