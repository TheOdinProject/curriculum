const { join } = require("node:path");
const { readFile } = require("node:fs/promises");
const { describe, it } = require("node:test");
const assert = require("node:assert/strict");
const getLintErrors = require("../../test_utils/lint")(__dirname);
const fixLintErrors = require("../../test_utils/fix")(__dirname);
const rule = require("../TOP002_noCodeInHeadings");

const pathInRepo = "markdownlint/TOP002_noCodeInHeadings/tests";
const expected = {
  name: "TOP002/no-code-headings",
  description: "No inline code in headings",
  information: new URL(
    "https://github.com/TheOdinProject/curriculum/blob/main/markdownlint/docs/TOP002.md",
  ),
};

describe("TOP002", () => {
  describe("Lint", () => {
    it("Links to the TOP002 docs", () => {
      assert.deepEqual(rule.information, expected.information);
    });

    it("Flags inline code in headings", async () => {
      const filePath = "test.md";
      const errorPath = join(pathInRepo, filePath);
      const lintErrors = await getLintErrors(filePath);

      assert.deepEqual(lintErrors, [
        `${errorPath}:15 error ${expected.name} ${expected.description} [Headings should not contain inline code.] [Context: "\`heading\`"]`,
        `${errorPath}:19 error ${expected.name} ${expected.description} [Headings should not contain inline code.] [Context: "\`other heading\`"]`,
        `${errorPath}:19 error ${expected.name} ${expected.description} [Headings should not contain inline code.] [Context: "\`flagged\`"]`,
      ]);
    });
  });

  describe("Fix", () => {
    it("Strips inline code blocks in headings", async () => {
      const fixedFileContents = await fixLintErrors("./test.md");
      const correctFile = await readFile(join(__dirname, "./fixed_test.md"));

      assert.equal(fixedFileContents, correctFile.toString());
    });
  });
});
