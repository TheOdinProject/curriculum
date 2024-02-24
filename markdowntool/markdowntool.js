const path = require("path");
const fs = require("fs").promises;
const { processLesson } = require("./processLesson");
const { processDirectory } = require("./processDirectory");

// async function handleDirectory(path) {
//   console.log(`Processing directory at ${directoryPath}`);
//   const rootDirectory = path.resolve(process.env.HOME, "dt/curriculum/ruby");
//   await processDirectory(rootDirectory);
// }

// async function handleLesson() {
//   console.log(`Processing lesson at ${lessonPath}`);
//   const testLesson = path.resolve(
//     process.env.HOME,
//     "dt/markdown-processor-test.md"
//   );
//   await processLesson(testLesson);
// }

const curriculumPath = path.resolve("../");

async function main() {
  const args = process.argv.slice(2);
  if (args.length === 0) {
    console.log(
      "Please specify a path relative to the curriculum folder or a full path."
    );
    return;
  }

  const inputPath = args[0];
  const fullPath = path.resolve(curriculumPath, inputPath);

  try {
    const stats = await fs.stat(fullPath);
    if (stats.isFile() && fullPath.endsWith(".md")) {
      await processLesson(fullPath);
    } else if (stats.isDirectory()) {
      await processDirectory(fullPath);
    } else {
      console.log("Path is neither a markdown file nor a directory.");
    }
  } catch (error) {
    console.error(`Error processing the path: ${error.message}`);
  }
}

main();
