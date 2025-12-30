const { join } = require("node:path");
const { readFile } = require("node:fs/promises");
const { describe, it } = require("node:test");
const assert = require("node:assert/strict");
const getLintErrors = require("../../test_utils/lint")(__dirname);
const fixLintErrors = require("../../test_utils/fix")(__dirname);
const rule = require("../TOP005_blanksAroundMultilineHtmlTags");

const pathInRepo = "markdownlint/TOP005_blanksAroundMultilineHtmlTags/tests";
const expected = {
  name: "TOP005/blanks-around-multiline-html-tags",
  description:
    "Multiline HTML tags should be surrounded by blank lines or code block delimiters",
  information: new URL(
    "https://github.com/TheOdinProject/curriculum/blob/main/markdownlint/docs/TOP005.md",
  ),
};

describe("TOP005", () => {
  describe("Lint", () => {
    it("Links to the TOP005 docs", () => {
      assert.deepEqual(rule.information, expected.information);
    });

    it("Flags when markdown multiline HTML tags are not surrounded by blank lines or code block delimiters", async () => {
      const filePath = "./flagged_tags.md";
      const errorPath = join(pathInRepo, filePath);
      const lintErrors = await getLintErrors(filePath);

      assert.deepEqual(lintErrors, [
        `${errorPath}:19 error ${expected.name} ${expected.description} [Expected a blank line or a code block delimiter (\`\`\`) after the tag] [Context: "<div class="lesson-content__panel" markdown="1">"]`,
        `${errorPath}:28 error ${expected.name} ${expected.description} [Expected a blank line or a code block delimiter (\`\`\`) before the tag] [Context: "<div class="lesson-content__panel" markdown="1">"]`,
        `${errorPath}:35 error ${expected.name} ${expected.description} [Expected a blank line or a code block delimiter (\`\`\`) after the tag] [Context: "<div>"]`,
        `${errorPath}:37 error ${expected.name} ${expected.description} [Expected a blank line or a code block delimiter (\`\`\`) before the tag and after the tag] [Context: "</div>"]`,
        `${errorPath}:38 error ${expected.name} ${expected.description} [Expected a blank line or a code block delimiter (\`\`\`) before the tag and after the tag] [Context: "<div>"]`,
        `${errorPath}:40 error ${expected.name} ${expected.description} [Expected a blank line or a code block delimiter (\`\`\`) before the tag] [Context: "</div>"]`,
        `${errorPath}:46 error ${expected.name} ${expected.description} [Expected a blank line or a code block delimiter (\`\`\`) before the tag] [Context: "</div>"]`,
        `${errorPath}:50 error ${expected.name} ${expected.description} [Expected a blank line or a code block delimiter (\`\`\`) after the tag] [Context: "<p>"]`,
        `${errorPath}:52 error ${expected.name} ${expected.description} [Expected a blank line or a code block delimiter (\`\`\`) before the tag] [Context: "</p>"]`,
        `${errorPath}:54 error ${expected.name} ${expected.description} [Expected a blank line or a code block delimiter (\`\`\`) after the tag] [Context: "<div>"]`,
        `${errorPath}:55 error ${expected.name} ${expected.description} [Expected a blank line or a code block delimiter (\`\`\`) before the tag and after the tag] [Context: "  <p>"]`,
        `${errorPath}:57 error ${expected.name} ${expected.description} [Expected a blank line or a code block delimiter (\`\`\`) before the tag and after the tag] [Context: "  </p>"]`,
        `${errorPath}:58 error ${expected.name} ${expected.description} [Expected a blank line or a code block delimiter (\`\`\`) before the tag] [Context: "</div>"]`,
      ]);
    });

    it("Does not flag when no rule violations", async () => {
      const filePath = "./ignored_tags.md";
      const lintErrors = await getLintErrors(filePath);

      assert.deepEqual(lintErrors, []);
    });
  });

  describe("Fix", () => {
    it("Wraps flagged multiline HTML tags with missing blank lines", async () => {
      const fixedFileContents = await fixLintErrors("./flagged_tags.md");
      const correctFile = await readFile(
        join(__dirname, "./fixed_flagged_tags.md"),
      );

      assert.equal(fixedFileContents, correctFile.toString());
    });
  });
});
