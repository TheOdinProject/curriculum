const { join } = require("node:path");
const { readFile } = require("node:fs/promises");
const { describe, it } = require("node:test");
const assert = require("node:assert/strict");
const getLintErrors = require("../../test_utils/lint")(__dirname);
const fixLintErrors = require("../../test_utils/fix")(__dirname);
const rule = require("../TOP010_useLazyNumbering");

const pathInRepo = "markdownlint/TOP010_useLazyNumbering/tests";
const expected = {
  name: "TOP010/lazy-numbering-for-ordered-lists",
  description: "Ordered lists must always use 1. as a prefix (lazy numbering)",
  information: new URL(
    "https://github.com/TheOdinProject/curriculum/blob/main/markdownlint/docs/TOP010.md",
  ),
};

describe("TOP010", () => {
  describe("Lint", () => {
    it("Links to the TOP010 docs", () => {
      assert.deepEqual(rule.information, expected.information);
    });

    it("Flags non-1 ordered list prefixes", async () => {
      const filePath = "./test.md";
      const errorPath = join(pathInRepo, filePath);
      const lintErrors = await getLintErrors(filePath);

      assert.deepEqual(lintErrors, [
        `${errorPath}:26 error ${expected.name} ${expected.description} [   Expected: "1"   Actual: "2" ]`,
        `${errorPath}:28 error ${expected.name} ${expected.description} [   Expected: "   1"   Actual: "   2" ]`,
        `${errorPath}:29 error ${expected.name} ${expected.description} [   Expected: "1"   Actual: "3" ]`,
        `${errorPath}:38 error ${expected.name} ${expected.description} [   Expected: "1"   Actual: "2" ]`,
      ]);
    });
  });

  describe("Fix", () => {
    it("Replaces non-1 ordered list prefixes with 1", async () => {
      const fixedFileContents = await fixLintErrors("./test.md");
      const correctFile = await readFile(join(__dirname, "./fixed_test.md"));

      assert.equal(fixedFileContents, correctFile.toString());
    });
  });
});
