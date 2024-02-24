import fs from "fs/promises";
import path from "path";

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

export { processDirectory };
