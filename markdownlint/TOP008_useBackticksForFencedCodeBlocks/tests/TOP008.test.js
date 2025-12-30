const { join } = require("node:path");
const { readFile } = require("node:fs/promises");
const { describe, it } = require("node:test");
const assert = require("node:assert/strict");
const getLintErrors = require("../../test_utils/lint")(__dirname);
const fixLintErrors = require("../../test_utils/fix")(__dirname);
const rule = require("../TOP008_useBackticksForFencedCodeBlocks");

const pathInRepo = "markdownlint/TOP008_useBackticksForFencedCodeBlocks/tests";
const expected = {
  name: "TOP008/use-backticks-for-fenced-code-blocks",
  description: "Fenced code blocks should use backticks instead of tildes",
  information: new URL(
    "https://github.com/TheOdinProject/curriculum/blob/main/markdownlint/docs/TOP008.md",
  ),
};

describe("TOP008", () => {
  describe("Lint", () => {
    it("Links to the TOP008 docs", () => {
      assert.deepEqual(rule.information, expected.information);
    });

    it("Flags code blocks with tilde delimiters", async () => {
      const filePath = "./test.md";
      const errorPath = join(pathInRepo, filePath);
      const lintErrors = await getLintErrors(filePath);

      assert.deepEqual(lintErrors, [
        `${errorPath}:21 error ${expected.name} ${expected.description} [Expected: "\`\`\`"; Actual: "~~~"] [Context: "~~~text"]`,
        `${errorPath}:23 error ${expected.name} ${expected.description} [Expected: "\`\`\`"; Actual: "~~~"] [Context: "~~~"]`,
        `${errorPath}:25 error ${expected.name} ${expected.description} [Expected: "\`\`\`\`"; Actual: "~~~~"] [Context: "~~~~markdown"]`,
        `${errorPath}:26 error ${expected.name} ${expected.description} [Expected: "\`\`\`"; Actual: "~~~"] [Context: "~~~text"]`,
        `${errorPath}:28 error ${expected.name} ${expected.description} [Expected: "\`\`\`"; Actual: "~~~"] [Context: "~~~"]`,
        `${errorPath}:29 error ${expected.name} ${expected.description} [Expected: "\`\`\`\`"; Actual: "~~~~"] [Context: "~~~~"]`,
        `${errorPath}:33 error ${expected.name} ${expected.description} [Expected: "\`\`\`"; Actual: "~~~"] [Context: "   ~~~text"]`,
        `${errorPath}:35 error ${expected.name} ${expected.description} [Expected: "\`\`\`"; Actual: "~~~"] [Context: "   ~~~"]`,
      ]);
    });
  });

  describe("Fix", () => {
    it("Replaces tilde delimiters with backticks", async () => {
      const fixedFileContents = await fixLintErrors("./test.md");
      const correctFile = await readFile(join(__dirname, "./fixed_test.md"));

      assert.equal(fixedFileContents, correctFile.toString());
    });
  });
});
