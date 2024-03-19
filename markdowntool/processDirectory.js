const fs = require("fs/promises");
const path = require("path");
const { processLesson } = require("./processLesson");

async function processDirectory(directoryPath) {
  const entries = await fs.readdir(directoryPath, { withFileTypes: true });
  for (let entry of entries) {
    const fullPath = path.join(directoryPath, entry.name);
    if (entry.isDirectory()) {
      await processDirectory(fullPath);
    } else if (entry.isFile() && fullPath.endsWith(".md")) {
      await processLesson(fullPath);
    }
  }
}

module.exports = { processDirectory };
