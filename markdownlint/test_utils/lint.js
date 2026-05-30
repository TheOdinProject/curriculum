const { join } = require("node:path");
const { access } = require("node:fs/promises");
const { promisify } = require("node:util");
const exec = promisify(require("node:child_process").exec);

/**
 * @param {string} dirname - Pass in the __dirname global for a function relative to the current test file
 */
module.exports = (dirname) => {
  /**
   * @param {string} filePath - Path to markdown file relative to current test file
   * @returns {Promise<string[]>} Array of markdownlint error strings, each error being its own element
   * @throws {Error} with .code === 'ENOENT' if no file at given path
   */
  return async (filePath) => {
    const markdownFileFullPath = join(dirname, filePath);

    // don't catch - we want this to throw and halt the tests if the file does not exist
    await access(markdownFileFullPath);

    try {
      await exec(`npm run lint -- "${markdownFileFullPath}"`);
      return [];
    } catch (error) {
      return error.stderr.trim().split("\n");
    }
  };
};
