const { join } = require("node:path");
const { describe, it } = require("node:test");
const assert = require("node:assert/strict");
const getLintErrors = require("../../test_utils/lint")(__dirname);
const rule = require("../TOP004_lessonHeadings");

const pathInRepo = "markdownlint/TOP004_lessonHeadings/tests";
const expected = {
  name: "TOP004/lesson-headings",
  description: "Required heading structure",
  information: new URL(
    "https://github.com/TheOdinProject/curriculum/blob/main/markdownlint/docs/TOP004.md",
  ),
};

describe("TOP004", () => {
  it("Links to the TOP004 docs", () => {
    assert.deepEqual(rule.information, expected.information);
  });

  it("Flags when a required heading is missing", async () => {
    const filePath = "./missing_heading.md";
    const errorPath = join(pathInRepo, filePath);
    const lintErrors = await getLintErrors(filePath);

    assert.deepEqual(lintErrors, [
      `${errorPath}:5 error ${expected.name} ${expected.description} [Expected: ### Lesson overview; Actual: ### Custom section]`,
    ]);
  });

  it("Flags when a level-specific wildcard heading uses the wrong level", async () => {
    const filePath = "./wrong_wildcard_level.md";
    const errorPath = join(pathInRepo, filePath);
    const lintErrors = await getLintErrors(filePath);

    assert.deepEqual(lintErrors, [
      `${errorPath}:21 error ${expected.name} ${expected.description} [Expected: h4 heading; Actual: h3 heading] [Context: "### An invalid wildcard heading"]`,
    ]);
  });

  it("Does not flag any errors if no heading structure violations", async () => {
    const filePath = "./valid_with_additional_resources.md";
    const lintErrors = await getLintErrors(filePath);

    assert.deepEqual(lintErrors, []);
  });

  it("Does not flag in a valid lesson file without additional resources", async () => {
    const filePath = "./valid_no_additional_resources.md";
    const lintErrors = await getLintErrors(filePath);

    assert.deepEqual(lintErrors, []);
  });

  describe("Projects", () => {
    it("Flags incorrect heading structure in a project", async () => {
      const filePath = "./project_invalid.md";
      const errorPath = join(pathInRepo, filePath);
      const lintErrors = await getLintErrors(filePath);

      assert.deepEqual(lintErrors, [
        `${errorPath}:12 error ${expected.name} ${expected.description} [Missing heading (case sensitive): ### Assignment] [Context: "### Assignment"]`,
      ]);
    });

    it("Does not flag a project if no heading structure violations", async () => {
      const filePath = "./project_valid.md";
      const lintErrors = await getLintErrors(filePath);

      assert.deepEqual(lintErrors, []);
    });
  });

  describe("Lesson exceptions", () => {
    it("Does not flag in a Conclusion lesson", async () => {
      const filePath = "./conclusion.md";
      const lintErrors = await getLintErrors(filePath);

      assert.deepEqual(lintErrors, []);
    });

    it("Does not flag in a How This Course Will Work lesson", async () => {
      const filePath = "./how_this_course_will_work.md";
      const lintErrors = await getLintErrors(filePath);

      assert.deepEqual(lintErrors, []);
    });
  });

  describe("Guides", () => {
    it("Flags when first heading does not start correctly", async () => {
      const filePath = "./_guides/guide_invalid.md";
      const errorPath = join(pathInRepo, filePath);
      const lintErrors = await getLintErrors(filePath);

      assert.deepEqual(lintErrors, [
        `${errorPath}:1 error ${expected.name} ${expected.description} [Expected: heading starting with "### Guide: "; Actual: ### Installation Guide]`,
      ]);
    });

    it("Does not flag any errors if no violations", async () => {
      const filePath = "./_guides/guide_valid.md";
      const lintErrors = await getLintErrors(filePath);

      assert.deepEqual(lintErrors, []);
    });
  });
});
