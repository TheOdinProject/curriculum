// Customized version of https://github.com/DavidAnson/markdownlint/blob/main/lib/md043.js

function addError(onError, lineNumber, detail, context, range, fixInfo) {
  onError({
    lineNumber,
    detail,
    context,
    range,
    fixInfo,
  });
}
function addErrorContext(
  onError,
  lineNumber,
  context,
  left,
  right,
  range,
  fixInfo
) {
  context = ellipsify(context, left, right);
  addError(onError, lineNumber, undefined, context, range, fixInfo);
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
function ellipsify(text, start, end) {
  if (text.length <= 30) {
    // Nothing to do
  } else if (start && end) {
    text = text.slice(0, 15) + "..." + text.slice(-15);
  } else if (end) {
    text = "..." + text.slice(-30);
  } else {
    text = text.slice(0, 30) + "...";
  }
  return text;
}

module.exports = {
  names: ["TOP004", "lesson-headings"],
  description: "Required heading structure",
  tags: ["headings"],
  function: function TOP004(params, onError) {
    const requiredHeadings = params.config.headings;
    if (!Array.isArray(requiredHeadings)) {
      // Nothing to check; avoid doing any work
      return;
    }
    const matchCase = params.config.match_case || false;
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
    const handleCase = (str) => (matchCase ? str : str.toLowerCase());
    // https://regexr.com/7rf1o to test the following regex:
    const wildcardRegex = new RegExp(/^(#*\s)?\*$/);

    forEachHeading(params, (heading, content) => {
      if (!hasError) {
        anyHeadings = true;
        const actual = levels[heading.tag] + " " + content;
        const expected = getExpected();

        if (wildcardRegex.test(expected)) {
          const nextExpected = getExpected();
          if (handleCase(nextExpected) !== handleCase(actual)) {
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
        } else if (handleCase(expected) === handleCase(actual)) {
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
