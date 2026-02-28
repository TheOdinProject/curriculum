const { join } = require("node:path");
const { readFile } = require("node:fs/promises");
const { describe, it } = require("node:test");
const assert = require("node:assert/strict");
const getLintErrors = require("../../test_utils/lint")(__dirname);
const fixLintErrors = require("../../test_utils/fix")(__dirname);
const rule = require("../TOP012_noteBoxHeadings");

const pathInRepo = "markdownlint/TOP012_noteBoxHeadings/tests";
const expected = {
  name: "TOP012/note-box-headings",
  description: "Note boxes have appropriate headings",
  information: new URL(
    "https://github.com/TheOdinProject/curriculum/blob/main/markdownlint/docs/TOP012.md",
  ),
};

describe("TOP012", () => {
  describe("Lint", () => {
    it("Links to the TOP012 docs", () => {
      assert.deepEqual(rule.information, expected.information);
    });

    it("Flags note boxes with missing headings", async () => {
      const filePath = "./missing_heading.md";
      const errorPath = join(pathInRepo, filePath);
      const lintErrors = await getLintErrors(filePath);

      assert.deepEqual(lintErrors, [
        `${errorPath}:13 error ${expected.name} ${expected.description} [Note box is missing a heading. Note boxes must start with a level 4 heading (####).]`,
      ]);
    });

    it("Flags note boxes with incorrectly levelled headings", async () => {
      const filePath = "./incorrect_heading_level.md";
      const errorPath = join(pathInRepo, filePath);
      const lintErrors = await getLintErrors(filePath);

      assert.deepEqual(lintErrors, [
        `${errorPath}:27 error ${expected.name} ${expected.description} [Expected a level 4 heading (####) but got a level 3 heading (###) instead.] [Context: "### Level 3 note box heading: Will flag error as it should be level 4"]`,
        `${errorPath}:35 error ${expected.name} ${expected.description} [Expected a level 4 heading (####) but got a level 2 heading (##) instead.] [Context: "## Level 2 note box heading: Will flag error as it should be level 4"]`,
      ]);
    });
  });

  describe("Fix", () => {
    it("Does not flag TOP012 in the fixed test md file", async () => {
      const file = "./fixed_incorrect_heading_level.md";
      const lintErrors = await getLintErrors(file);

      assert(
        lintErrors.every((error) => !error.includes(expected.name)),
        `"${file}" contains TOP012 errors`,
      );
    });

    it("Converts incorrectly levelled note box headings to level 4", async () => {
      const fixedFileContents = await fixLintErrors(
        "./incorrect_heading_level.md",
      );
      const correctFile = await readFile(
        join(__dirname, "./fixed_incorrect_heading_level.md"),
      );

      assert.equal(fixedFileContents, correctFile.toString());
    });
  });
});
