import fs from "fs/promises";
import path from "path";

function updateLesson(lesson, updatedContent) {
  const newContent = updatedContent.map((line) => line.content);
  const joined = newContent.join("\n");
  fs.writeFile(lesson, joined, "utf8", (err) => {
    if (err) throw err;
    console.log(`Processed: ${lesson}`);
  });
}

function getLesson(pathToLesson) {
  const file = path.resolve(process.env.HOME, pathToLesson);
  return file;
}

export { getLesson, updateLesson };
