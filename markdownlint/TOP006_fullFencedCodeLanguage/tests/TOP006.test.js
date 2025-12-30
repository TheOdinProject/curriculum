const { join } = require("node:path");
const { readFile } = require("node:fs/promises");
const { describe, it } = require("node:test");
const assert = require("node:assert/strict");
const getLintErrors = require("../../test_utils/lint")(__dirname);
const fixLintErrors = require("../../test_utils/fix")(__dirname);
const rule = require("../TOP006_fullFencedCodeLanguage");

const pathInRepo = "markdownlint/TOP006_fullFencedCodeLanguage/tests";
const expected = {
  name: "TOP006/full-fenced-code-language",
  description:
    "Fenced code blocks must use the full name for a language if both full and abbreviated options are valid.",
  information: new URL(
    "https://github.com/TheOdinProject/curriculum/blob/main/markdownlint/docs/TOP006.md",
  ),
};

describe("TOP006", () => {
  describe("Lint", () => {
    it("Links to the TOP006 docs", () => {
      assert.deepEqual(rule.information, expected.information);
    });

    it("Flags abbreviated code block languages", async () => {
      const filePath = "./test.md";
      const errorPath = join(pathInRepo, filePath);
      const lintErrors = await getLintErrors(filePath);

      assert.deepEqual(lintErrors, [
        `${errorPath}:21 error ${expected.name} ${expected.description} [Expected: javascript; Actual: js] [Context: "\`\`\`js"]`,
        `${errorPath}:26 error ${expected.name} ${expected.description} [Expected: javascript; Actual: js] [Context: "~~~js"]`,
        `${errorPath}:45 error ${expected.name} ${expected.description} [Expected: ruby; Actual: rb] [Context: "\`\`\`rb"]`,
        `${errorPath}:53 error ${expected.name} ${expected.description} [Expected: text; Actual: txt] [Context: "\`\`\`txt"]`,
        `${errorPath}:57 error ${expected.name} ${expected.description} [Expected: yaml; Actual: yml] [Context: "\`\`\`yml"]`,
        `${errorPath}:65 error ${expected.name} ${expected.description} [Expected: bash; Actual: sh] [Context: "\`\`\`sh"]`,
        `${errorPath}:88 error ${expected.name} ${expected.description} [Expected: markdown; Actual: md] [Context: "\`\`\`\`md"]`,
        `${errorPath}:89 error ${expected.name} ${expected.description} [Expected: javascript; Actual: js] [Context: "\`\`\`js"]`,
        `${errorPath}:96 error ${expected.name} ${expected.description} [Expected: javascript; Actual: js] [Context: "   \`\`\`js"]`,
      ]);
    });
  });

  describe("Fix", () => {
    it("Replaces abbreviated code block languages with full name", async () => {
      const fixedFileContents = await fixLintErrors("./test.md");
      const correctFile = await readFile(join(__dirname, "./fixed_test.md"));

      assert.equal(fixedFileContents, correctFile.toString());
    });
  });
});
