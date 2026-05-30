const { join } = require("node:path");
const { describe, it } = require("node:test");
const assert = require("node:assert/strict");
const getLintErrors = require("../../test_utils/lint")(__dirname);
const rule = require("../TOP001_descriptiveLinkTextLabels");

const pathInRepo = "markdownlint/TOP001_descriptiveLinkTextLabels/tests";
const expected = {
  name: "TOP001/descriptive-link-text-labels",
  description: "Links must have descriptive text labels",
  information: new URL(
    "https://github.com/TheOdinProject/curriculum/blob/main/markdownlint/docs/TOP001.md",
  ),
};

describe("TOP001", () => {
  it("Links to the TOP001 docs", () => {
    assert.deepEqual(rule.information, expected.information);
  });

  it('Flags link text labels containing "this" or "here"', async () => {
    const filePath = "./this_or_here.md";
    const errorPath = join(pathInRepo, filePath);
    const lintErrors = await getLintErrors(filePath);

    assert.deepEqual(lintErrors, [
      `${errorPath}:23 error ${expected.name} ${expected.description} [Expected text to not include the words "this" or "here". Use a more descriptive label that clearly conveys the purpose or content of the link.] [Context: "[this](someURL)"]`,
      `${errorPath}:24 error ${expected.name} ${expected.description} [Expected text to not include the words "this" or "here". Use a more descriptive label that clearly conveys the purpose or content of the link.] [Context: "[This video](someURL)"]`,
      `${errorPath}:25 error ${expected.name} ${expected.description} [Expected text to not include the words "this" or "here". Use a more descriptive label that clearly conveys the purpose or content of the link.] [Context: "[here](someURL)"]`,
      `${errorPath}:26 error ${expected.name} ${expected.description} [Expected text to not include the words "this" or "here". Use a more descriptive label that clearly conveys the purpose or content of the link.] [Context: "[Click here](someURL)"]`,
      `${errorPath}:27 error ${expected.name} ${expected.description} [Expected text to not include the words "this" or "here". Use a more descriptive label that clearly conveys the purpose or content of the link.] [Context: "[This other thing](someURL)"]`,
      `${errorPath}:28 error ${expected.name} ${expected.description} [Expected text to not include the words "this" or "here". Use a more descriptive label that clearly conveys the purpose or content of the link.] [Context: "[This blog post about flex-grow will be flagged as a false positive, but could still be updated](someURL)"]`,
      `${errorPath}:29 error ${expected.name} ${expected.description} [Expected text to not include the words "this" or "here". Use a more descriptive label that clearly conveys the purpose or content of the link.] [Context: "[This will get caught](someURL)"]`,
      `${errorPath}:29 error ${expected.name} ${expected.description} [Expected text to not include the words "this" or "here". Use a more descriptive label that clearly conveys the purpose or content of the link.] [Context: "[this as separate matches](someURL)"]`,
    ]);
  });

  it("Flags blacklisted link text labels", async () => {
    const filePath = "./blacklisted_label_text.md";
    const errorPath = join(pathInRepo, filePath);
    const lintErrors = await getLintErrors(filePath);

    assert.deepEqual(lintErrors, [
      `${errorPath}:23 error ${expected.name} ${expected.description} ["video" is not sufficiently descriptive by itself. Use a more descriptive label that clearly conveys the purpose or content of the link.] [Context: "[video](someURL)"]`,
      `${errorPath}:24 error ${expected.name} ${expected.description} ["videos" is not sufficiently descriptive by itself. Use a more descriptive label that clearly conveys the purpose or content of the link.] [Context: "[videos](someURL)"]`,
      `${errorPath}:25 error ${expected.name} ${expected.description} ["a video" is not sufficiently descriptive by itself. Use a more descriptive label that clearly conveys the purpose or content of the link.] [Context: "[a video](someURL)"]`,
      `${errorPath}:26 error ${expected.name} ${expected.description} ["docs" is not sufficiently descriptive by itself. Use a more descriptive label that clearly conveys the purpose or content of the link.] [Context: "[docs](someURL)"]`,
      `${errorPath}:27 error ${expected.name} ${expected.description} ["the documentation" is not sufficiently descriptive by itself. Use a more descriptive label that clearly conveys the purpose or content of the link.] [Context: "[the documentation](someURL)"]`,
      `${errorPath}:28 error ${expected.name} ${expected.description} ["their documentation" is not sufficiently descriptive by itself. Use a more descriptive label that clearly conveys the purpose or content of the link.] [Context: "[their documentation](someURL)"]`,
      `${errorPath}:29 error ${expected.name} ${expected.description} ["page" is not sufficiently descriptive by itself. Use a more descriptive label that clearly conveys the purpose or content of the link.] [Context: "[page](someURL)"]`,
      `${errorPath}:30 error ${expected.name} ${expected.description} ["their homepage" is not sufficiently descriptive by itself. Use a more descriptive label that clearly conveys the purpose or content of the link.] [Context: "[their homepage](someURL)"]`,
      `${errorPath}:31 error ${expected.name} ${expected.description} ["playlist" is not sufficiently descriptive by itself. Use a more descriptive label that clearly conveys the purpose or content of the link.] [Context: "[playlist](someURL)"]`,
      `${errorPath}:32 error ${expected.name} ${expected.description} ["a playlist" is not sufficiently descriptive by itself. Use a more descriptive label that clearly conveys the purpose or content of the link.] [Context: "[a playlist](someURL)"]`,
    ]);
  });
});
