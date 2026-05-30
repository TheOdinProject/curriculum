const { join } = require("node:path");
const { describe, it } = require("node:test");
const assert = require("node:assert/strict");
const getLintErrors = require("../../test_utils/lint")(__dirname);
const rule = require("../TOP009_lessonOverviewItemsSentenceStructure");

const pathInRepo =
  "markdownlint/TOP009_lessonOverviewItemsSentenceStructure/tests";
const expected = {
  name: "TOP009/lesson-overview-items-sentence-structure",
  description:
    "Lesson overview items must be statements, not questions, and must begin with a capital letter and end with a period.",
  information: new URL(
    "https://github.com/TheOdinProject/curriculum/blob/main/markdownlint/docs/TOP009.md",
  ),
};

describe("TOP009", () => {
  it("Links to the TOP009 docs", () => {
    assert.deepEqual(rule.information, expected.information);
  });

  it("Flags when lesson overview item does not begin with a capital letter", async () => {
    const filePath = "./capital_letter.md";
    const errorPath = join(pathInRepo, filePath);
    const lintErrors = await getLintErrors(filePath);

    assert.deepEqual(lintErrors, [
      `${errorPath}:10 error ${expected.name} ${expected.description} [Lesson overview items must be statements, not questions, and must begin with a capital letter and end with a period.] [Context: "lesson overview item 2."]`,
    ]);
  });

  it("Flags when lesson overview item does not end with a period", async () => {
    const filePath = "./invalid_punctuation.md";
    const errorPath = join(pathInRepo, filePath);
    const lintErrors = await getLintErrors(filePath);

    assert.deepEqual(lintErrors, [
      `${errorPath}:11 error ${expected.name} ${expected.description} [Lesson overview items must be statements, not questions, and must begin with a capital letter and end with a period.] [Context: "Lesson overview item 3?"]`,
      `${errorPath}:13 error ${expected.name} ${expected.description} [Lesson overview items must be statements, not questions, and must begin with a capital letter and end with a period.] [Context: "Lesson overview item 6"]`,
    ]);
  });

  it("Does not flag any errors if no rule violations", async () => {
    const filePath = "./valid.md";
    const lintErrors = await getLintErrors(filePath);

    assert.deepEqual(lintErrors, []);
  });
});
