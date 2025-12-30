const { join } = require("node:path");
const { readFile } = require("node:fs/promises");
const { describe, it } = require("node:test");
const assert = require("node:assert/strict");
const getLintErrors = require("../../test_utils/lint")(__dirname);
const fixLintErrors = require("../../test_utils/fix")(__dirname);
const rule = require("../TOP007_useMarkdownLinks");

const pathInRepo = "markdownlint/TOP007_useMarkdownLinks/tests";
const expected = {
  name: "TOP007/use-markdown-links",
  description:
    "Links used to navigate to external content or other landmarks in the page should use markdown links instead of HTML anchor tags.",
  information: new URL(
    "https://github.com/TheOdinProject/curriculum/blob/main/markdownlint/docs/TOP007.md",
  ),
};

describe("TOP007", () => {
  describe("Lint", () => {
    it("Links to the TOP007 docs", () => {
      assert.deepEqual(rule.information, expected.information);
    });

    it("Flags non-markdown links used for markdown purposes", async () => {
      const filePath = "./anchors_in_markdown.md";
      const errorPath = join(pathInRepo, filePath);
      const lintErrors = await getLintErrors(filePath);

      assert.deepEqual(lintErrors, [
        `${errorPath}:21 error ${expected.name} ${expected.description} [   Expected: "[Link should flag as we should be using a markdown link instead](#custom-section)"   Actual: "<a href="#custom-section">Link should flag as we should be using a markdown link instead</a>" ]`,
        `${errorPath}:23 error ${expected.name} ${expected.description} [   Expected: "[Will flag](#custom-section)"   Actual: "<a href="#custom-section">Will flag</a>" ]`,
        `${errorPath}:23 error ${expected.name} ${expected.description} [   Expected: "[multiple anchors](#assignment)"   Actual: "<a href="#assignment">multiple anchors</a>" ]`,
        `${errorPath}:26 error ${expected.name} ${expected.description} [   Expected: "[@TheOdinProjectExamples](https://codepen.io/TheOdinProjectExamples)"   Actual: "<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>" ]`,
        `${errorPath}:34 error ${expected.name} ${expected.description} [   Expected: "[Flags knowledge check anchors](#knowledge-check)"   Actual: "<a class="knowledge-check-link" href="#knowledge-check">Flags knowledge check anchors</a>" ]`,
      ]);
    });

    it("Does not flag any errors if no rule violations", async () => {
      const filePath = "./valid_anchors.md";
      const lintErrors = await getLintErrors(filePath);

      assert.deepEqual(lintErrors, []);
    });
  });

  describe("Fix", () => {
    it("Converts flagged anchors to markdown links", async () => {
      const fixedFileContents = await fixLintErrors("./anchors_in_markdown.md");
      const correctFile = await readFile(
        join(__dirname, "./fixed_anchors_in_markdown.md"),
      );

      assert.equal(fixedFileContents, correctFile.toString());
    });
  });
});
