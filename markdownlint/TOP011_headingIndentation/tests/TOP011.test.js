const { join } = require("node:path");
const { readFile } = require("node:fs/promises");
const { describe, it } = require("node:test");
const assert = require("node:assert/strict");
const getLintErrors = require("../../test_utils/lint")(__dirname);
const fixLintErrors = require("../../test_utils/fix")(__dirname);
const rule = require("../TOP011_headingIndentation");

const pathInRepo = "markdownlint/TOP011_headingIndentation/tests";
const expected = {
  name: "TOP011/heading-indentation",
  description: "Headings must not be indented unless they are for a note box.",
  information: new URL(
    "https://github.com/TheOdinProject/curriculum/blob/main/markdownlint/docs/TOP011.md",
  ),
};

describe("TOP011", () => {
  describe("Lint", () => {
    it("Links to the TOP011 docs", () => {
      assert.deepEqual(rule.information, expected.information);
    });

    it("Flags incorrectly indented headings", async () => {
      const filePath = "./test.md";
      const errorPath = join(pathInRepo, filePath);
      const lintErrors = await getLintErrors(filePath);

      assert.deepEqual(lintErrors, [
        `${errorPath}:19 error ${expected.name} ${expected.description} [Normal headings must not be indented.] [Context: "  ### This heading is indented so will flag an error"]`,
        `${errorPath}:47 error ${expected.name} ${expected.description} [Note box heading indented 9 spaces but should be indented 7 spaces instead to match the containing note box.] [Context: "         #### The note box and heading do not match indentation levels (7v9) so this should flag"]`,
        `${errorPath}:53 error ${expected.name} ${expected.description} [Note box heading indented 2 spaces but should be indented 0 spaces instead to match the containing note box.] [Context: "  #### The note box and heading do not match indentation levels (0v2) so this should flag"]`,
      ]);
    });
  });

  describe("Fix", () => {
    it("Fixes incorrect heading indentation", async () => {
      const fixedFileContents = await fixLintErrors("./test.md");
      const correctFile = await readFile(join(__dirname, "./fixed_test.md"));

      assert.equal(fixedFileContents, correctFile.toString());
    });
  });
});
