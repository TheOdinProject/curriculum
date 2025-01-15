// Customized version of https://github.com/DavidAnson/markdownlint/blob/main/lib/md043.js
const { basename } = require("node:path");

const HEADINGS = {
  lesson: [
    "### Introduction",
    "### Lesson overview",
    "*",
    "### Assignment",
    "#### *",
    "### Knowledge check",
    "### Additional resources",
  ],
  project: ["### Introduction", "*", "### Assignment", "*"],
};

function isProject(filePath) {
  const fileName = basename(filePath);
  // don't include names like "projections.md"
  return fileName.startsWith("project_") || fileName.startsWith("project-");
}
function addError(onError, lineNumber, detail, context, range, fixInfo) {
  onError({
    lineNumber,
    detail,
    context,
    range,
    fixInfo,
  });
}
function addErrorContext(onError, lineNumber, context) {
  addError(
    onError,
    lineNumber,
    `Missing heading (case sensitive): ${context}`,
    context
  );
}
function addErrorDetailIf(
  onError,
  lineNumber,
  expected,
  actual,
  detail,
  context,
  range,
  fixInfo
) {
  if (expected !== actual) {
    addError(
      onError,
      lineNumber,
      "Expected: " +
        expected +
        "; Actual: " +
        actual +
        (detail ? "; " + detail : ""),
      context,
      range,
      fixInfo
    );
  }
}
function forEachHeading(params, handler) {
  let heading = null;
  for (const token of params.parsers.markdownit.tokens) {
    if (token.type === "heading_open") {
      heading = token;
    } else if (token.type === "heading_close") {
      heading = null;
    } else if (token.type === "inline" && heading) {
      handler(heading, token.content, token);
    }
  }
}

module.exports = {
  names: ["TOP004", "lesson-headings"],
  description: "Required heading structure",
  tags: ["headings"],
  parser: "markdownit",
  information: new URL(
    "https://github.com/TheOdinProject/curriculum/blob/main/markdownlint/docs/TOP004.md"
  ),
  function: function TOP004(params, onError) {
    const requiredHeadings = isProject(params.name)
      ? HEADINGS.project
      : HEADINGS.lesson;
    const levels = {};
    for (const level of [1, 2, 3, 4, 5, 6]) {
      levels["h" + level] = "######".substr(-level);
    }
    let i = 0;
    let matchAny = false;
    let headingToMatch = undefined;
    let hasError = false;
    let anyHeadings = false;
    const getExpected = () => requiredHeadings[i++] || "[None]";
    // https://regexr.com/7rf1o to test the following regex:
    const wildcardRegex = new RegExp(/^(#*\s)?\*$/);

    forEachHeading(params, (heading, content) => {
      if (!hasError) {
        anyHeadings = true;
        const actual = levels[heading.tag] + " " + content;
        const expected = getExpected();

        if (wildcardRegex.test(expected)) {
          const nextExpected = getExpected();
          if (nextExpected !== actual) {
            if (expected.startsWith("#")) {
              headingToMatch = `h${
                expected.slice(0, expected.indexOf(" ")).length
              }`;

              addErrorDetailIf(
                onError,
                heading.lineNumber,
                `${headingToMatch} heading`,
                `${heading.tag} heading`
              );
              hasError = headingToMatch !== heading.tag;
            } else {
              matchAny = true;
            }
            i--;
          }
        } else if (expected === actual) {
          matchAny = false;
          headingToMatch = undefined;
        } else if (matchAny) {
          i--;
        } else if (headingToMatch) {
          if (headingToMatch !== heading.tag) {
            addError(
              onError,
              heading.lineNumber,
              `Expected: ${headingToMatch} heading; Actual: ${heading.tag} heading`
            );
            hasError = true;
          } else {
            i--;
          }
        } else {
          addErrorDetailIf(onError, heading.lineNumber, expected, actual);
          hasError = true;
        }
      }
    });

    const extraHeadings = requiredHeadings.length - i;
    if (
      !hasError &&
      (extraHeadings > 1 ||
        (extraHeadings === 1 && !wildcardRegex.test(requiredHeadings[i]))) &&
      (anyHeadings ||
        !requiredHeadings.every((heading) => wildcardRegex.test(heading)))
    ) {
      addErrorContext(onError, params.lines.length, requiredHeadings[i]);
    }
  },
};
