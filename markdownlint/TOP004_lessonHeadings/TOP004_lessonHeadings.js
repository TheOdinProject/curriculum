// Customized version of https://github.com/DavidAnson/markdownlint/blob/main/lib/md043.mjs
const { basename } = require("node:path");

// No sensible heading structure we can enforce for lessons with these file names
const exceptedLessons = [
  "how_this_course_will_work.md",
  "conclusion.md",
  "conclusion_full_stack_javascript.md",
  "conclusion_ruby_on_rails.md",
];

const HEADINGS = {
  lesson: [
    "### Introduction",
    "### Lesson overview",
    "*",
    "### Assignment",
    "#### *",
    "### Knowledge check",
    "?",
  ],
  project: ["### Introduction", "*", "### Assignment", "#### *"],
  guide: ["### Guide: *", "*"],
};

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
    "https://github.com/TheOdinProject/curriculum/blob/main/markdownlint/docs/TOP004.md",
  ),
  function: function TOP004(params, onError) {
    const fileName = basename(params.name);
    if (exceptedLessons.includes(fileName)) {
      return;
    }

    const requiredHeadings = (() => {
      // don't include names like "projections.md"
      if (fileName.startsWith("project_")) {
        return HEADINGS.project;
      } else if (params.name.includes("_guides/")) {
        return HEADINGS.guide;
      }
      return HEADINGS.lesson;
    })();
    const levels = {
      h1: "#",
      h2: "##",
      h3: "###",
      h4: "####",
      h5: "#####",
      h6: "######",
    };

    let i = 0;
    let matchAny = false;
    let headingToMatch = undefined;
    let hasError = false;
    let hasHeadingsInFile = false;

    const getExpected = () => requiredHeadings[i++] || "[None]";
    // https://regexr.com/7rf1o to test the following regex:
    const wildcardRegex = new RegExp(/^(#*\s)?\*$/);
    // https://regexr.com/8j19m to test the following regex:
    const prefixWildcardRegex = new RegExp(/^(###\s)(.+):\s\*$/);

    forEachHeading(params, (heading, content) => {
      // Report only first instance of TOP004 error
      // If one's wrong, it may directly cause later headings to flag
      if (hasError) {
        return;
      }

      hasHeadingsInFile = true;
      const actual = levels[heading.tag] + " " + content;
      const expected = getExpected();

      // Allow single wildcard heading (https://github.com/DavidAnson/markdownlint/issues/475)
      if (expected === "?") {
        return;
      }

      // Handle prefix wildcards like "### Guide: *"
      const prefixMatch = expected.match(prefixWildcardRegex);
      if (prefixMatch) {
        const prefix = prefixMatch[1] + prefixMatch[2] + ": ";
        if (actual.startsWith(prefix)) {
          return;
        }
        onError({
          lineNumber: heading.lineNumber,
          detail: `Expected: heading starting with "${prefix}"; Actual: ${actual}`,
        });
        hasError = true;
        return;
      }

      if (wildcardRegex.test(expected)) {
        const nextExpected = getExpected();
        if (nextExpected === actual) {
          return;
        }

        // For level-specific wildcards
        if (expected.startsWith("#")) {
          headingToMatch = `h${
            expected.slice(0, expected.indexOf(" ")).length
          }`;

          if (headingToMatch !== heading.tag) {
            onError({
              lineNumber: heading.lineNumber,
              detail: `Expected: ${headingToMatch} heading; Actual: ${heading.tag} heading`,
              context: actual,
            });
            hasError = headingToMatch !== heading.tag;
          }
        } else {
          matchAny = true;
        }
        i--;
      } else if (expected === actual) {
        matchAny = false;
        headingToMatch = undefined;
      } else if (matchAny) {
        i--;
      } else if (headingToMatch) {
        if (headingToMatch !== heading.tag) {
          onError({
            lineNumber: heading.lineNumber,
            detail: `Expected: ${headingToMatch} heading; Actual: ${heading.tag} heading`,
          });
          hasError = true;
        } else {
          i--;
        }
      } else {
        onError({
          lineNumber: heading.lineNumber,
          detail: `Expected: ${expected}; Actual: ${actual}`,
        });
        hasError = true;
      }
    });

    const missingExpectedHeadingCount = requiredHeadings.length - i;
    const isWildcard =
      wildcardRegex.test(requiredHeadings[i]) || requiredHeadings[i] === "?";
    const isLastRequiredHeadingSpecific =
      missingExpectedHeadingCount === 1 && !isWildcard;
    const hasSpecificRequiredHeadings = requiredHeadings.some(
      (heading) => !wildcardRegex.test(heading) && heading !== "?",
    );

    if (
      hasSpecificRequiredHeadings &&
      !hasError &&
      (missingExpectedHeadingCount > 1 || isLastRequiredHeadingSpecific)
    ) {
      onError({
        lineNumber: params.lines.length,
        detail: `Missing heading (case sensitive): ${requiredHeadings[i]}`,
        context: requiredHeadings[i],
      });
    }
  },
};
