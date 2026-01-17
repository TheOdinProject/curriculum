const { join } = require("node:path");
const { readFile } = require("node:fs/promises");
const { spawnSync } = require("node:child_process");

/**
 * @param {string} dirname - Pass in the __dirname global for a function relative to the current test file
 */
module.exports = (dirname) => {
  /**
   * @param {string} filePath - Path to markdown file relative to current test file
   * @returns {Promise<string>} File contents after lint fixes applied
   * @throws {Error} with .code === 'ENOENT' if no file at given path
   */
  return async (filePath) => {
    const markdownFileFullPath = join(dirname, filePath);

    // don't catch - we want this to throw and halt the tests if the file does not exist
    const fileContents = await readFile(markdownFileFullPath);
    const childProcess = spawnSync(`npm`, ["run", "lint", "--", "--format"], {
      input: fileContents.toString(),
    });

    return (
      childProcess.stdout
        .toString()
        // get rid of the markdownlint-cli2 output noise
        .replace(
          "\n> curriculum@1.0.0 lint\n> markdownlint-cli2 --format\n\n",
          "",
        )
    );
  };
};
