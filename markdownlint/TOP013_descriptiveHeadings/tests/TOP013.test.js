const { join } = require("node:path");
const { describe, it } = require("node:test");
const assert = require("node:assert/strict");
const getLintErrors = require("../../test_utils/lint")(__dirname);
const rule = require("../TOP013_descriptiveHeadings");

const pathInRepo = "markdownlint/TOP013_descriptiveHeadings/tests";
const expected = {
  name: "TOP013/descriptive-headings",
  description: "Headings must have descriptive text",
  information: new URL(
    "https://github.com/TheOdinProject/curriculum/blob/main/markdownlint/docs/TOP013.md",
  ),
};

describe("TOP013", () => {
  it("Links to the TOP013 docs", () => {
    assert.deepEqual(rule.information, expected.information);
  });

  it("Flags blacklisted headings", async () => {
    const filePath = "./test.md";
    const errorPath = join(pathInRepo, filePath);
    const lintErrors = await getLintErrors(filePath);

    assert.deepEqual(lintErrors, [
      `${errorPath}:15 error ${expected.name} ${expected.description} ["Important" is not sufficiently descriptive by itself. Use a more descriptive heading that briefly but clearly summarizes the content of the section.] [Context: "### Important"]`,
      `${errorPath}:19 error ${expected.name} ${expected.description} ["A warning" is not sufficiently descriptive by itself. Use a more descriptive heading that briefly but clearly summarizes the content of the section.] [Context: "#### A warning"]`,
      `${errorPath}:25 error ${expected.name} ${expected.description} ["Remember" is not sufficiently descriptive by itself. Use a more descriptive heading that briefly but clearly summarizes the content of the section.] [Context: "#### Remember!"]`,
      `${errorPath}:35 error ${expected.name} ${expected.description} ["Important note" is not sufficiently descriptive by itself. Use a more descriptive heading that briefly but clearly summarizes the content of the section.] [Context: "  #### Important note"]`,
    ]);
  });
});
