const { join } = require("node:path");
const { describe, it } = require("node:test");
const assert = require("node:assert/strict");
const getLintErrors = require("../../test_utils/lint")(__dirname);
const rule = require("../TOP003_defaultSectionContent");

const pathInRepo = "markdownlint/TOP003_defaultSectionContent/tests";
const expected = {
  name: "TOP003/default-section-content",
  description: "Sections have default content",
  information: new URL(
    "https://github.com/TheOdinProject/curriculum/blob/main/markdownlint/docs/TOP003.md",
  ),
};

describe("TOP003", () => {
  it("Links to the TOP003 docs", () => {
    assert.deepEqual(rule.information, expected.information);
  });

  it("Flags when extra content surrounds default section lists", async () => {
    const filePath = "./content_around_list.md";
    const errorPath = join(pathInRepo, filePath);
    const lintErrors = await getLintErrors(filePath);

    assert.deepEqual(lintErrors, [
      `${errorPath}:9 error ${expected.name} ${expected.description} [Only an unordered list of lesson overviews can follow the default content.]`,
      `${errorPath}:13 error ${expected.name} ${expected.description} [There should be no additional content after the unordered list of lesson overviews]`,
    ]);
  });

  it("Flags when sections with default content are empty", async () => {
    const filePath = "./empty_section.md";
    const errorPath = join(pathInRepo, filePath);
    const lintErrors = await getLintErrors(filePath);

    assert.deepEqual(lintErrors, [
      `${errorPath}:5 error ${expected.name} ${expected.description} [The lesson overview section cannot be empty]`,
      `${errorPath}:19 error ${expected.name} ${expected.description} [The knowledge check section cannot be empty]`,
      `${errorPath}:21 error ${expected.name} ${expected.description} [The additional resources section cannot be empty]`,
    ]);
  });

  it("Flags when sections have incorrect default content", async () => {
    const filePath = "./incorrect_content.md";
    const errorPath = join(pathInRepo, filePath);
    const lintErrors = await getLintErrors(filePath);

    assert.deepEqual(lintErrors, [
      `${errorPath}:7 error ${expected.name} ${expected.description} [Expected: "This section contains a general overview of topics that you will learn in this lesson."; Actual: "This section has the wrong text following the heading that should flag an error."]`,
      `${errorPath}:25 error ${expected.name} ${expected.description} [Expect default content to precede unordered list of knowledge checks: "The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge."]`,
    ]);
  });

  it("Flags when a section does not have a required unordered list", async () => {
    const filePath = "./missing_list.md";
    const errorPath = join(pathInRepo, filePath);
    const lintErrors = await getLintErrors(filePath);

    assert.deepEqual(lintErrors, [
      `${errorPath}:7 error ${expected.name} ${expected.description} [Must include an unordered list of lesson overviews in the "lesson overview" section]`,
      `${errorPath}:23 error ${expected.name} ${expected.description} [Must include an unordered list of knowledge checks in the "knowledge check" section]`,
      `${errorPath}:27 error ${expected.name} ${expected.description} [Must include an unordered list of additional resources in the "additional resources" section]`,
    ]);
  });

  it("Flags when the assignment section is missing the necessary div wrapper", async () => {
    const filePath = "./missing_wrapper.md";
    const errorPath = join(pathInRepo, filePath);
    const lintErrors = await getLintErrors(filePath);

    assert.deepEqual(lintErrors, [
      `${errorPath}:15 error ${expected.name} ${expected.description} [Assignment sections must include an HTML div element with class="lesson-content__panel" and markdown="1" attributes]`,
    ]);
  });

  it("Flags when ordered or nested lists are used for unordered list sections", async () => {
    const filePath = "./nested_and_ordered_list.md";
    const errorPath = join(pathInRepo, filePath);
    const lintErrors = await getLintErrors(filePath);

    assert.deepEqual(lintErrors, [
      `${errorPath}:10 error ${expected.name} ${expected.description} [The lesson overview section must not contain nested lists.]`,
      `${errorPath}:29 error ${expected.name} ${expected.description} [The knowledge check section must not include any ordered lists.]`,
      `${errorPath}:29 error ${expected.name} ${expected.description} [Must include an unordered list of knowledge checks in the "knowledge check" section]`,
      `${errorPath}:30 error ${expected.name} ${expected.description} [The knowledge check section must not include any ordered lists.]`,
    ]);
  });

  it("Does not flag any errors if no violations", async () => {
    const filePath = "./valid.md";
    const lintErrors = await getLintErrors(filePath);

    assert.deepEqual(lintErrors, []);
  });
});
