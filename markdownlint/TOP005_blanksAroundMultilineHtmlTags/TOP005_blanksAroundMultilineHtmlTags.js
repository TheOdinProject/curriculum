module.exports = {
  names: ["TOP005", "blanks-around-multiline-html-tags"],
  description: "Multiline HTML tags should be surrounded by blank lines or code block delimiters",
  tags: ["html", "blank_lines"],
  information: new URL(
    "https://github.com/TheOdinProject/curriculum/blob/main/markdownlint/docs/TOP005.md"
  ),
  function: function TOP005(params, onError) {
    /**
     * HTML code in HTML/JSX code blocks should not be flagged.
     * We only want to flag HTML tags we use for actual markup,
     * or md code block examples of such.
     */
    const IGNORED_FENCE_TYPES = ["html", "jsx", "erb", "ejs"];
    const ignoredFencesLineRanges = params.tokens
      .filter((token) => {
        return token.type === "fence" && IGNORED_FENCE_TYPES.includes(token.info);
      })
      .map((token) => token.map);

    const isWithinIgnoredFence = (lineNumber) => {
      return ignoredFencesLineRanges.some(
        (range) => range[0] < lineNumber && lineNumber < range[1]
      );
    };

    const isolatedHtmlTagsLineNumbers = params.lines.reduce(
      (lineNumbers, currentLineText, currentLineNumber) => {
        // https://regexr.com/7u896 to test the following regex:
        if (/^<(?!!)\/?[^>]*>$/.test(currentLineText.trim())) {
          lineNumbers.push(currentLineNumber);
        }
        return lineNumbers;
      },
      []
    );

    isolatedHtmlTagsLineNumbers.forEach((lineNumber, i) => {
      if (isWithinIgnoredFence(lineNumber)) {
        return;
      }

      // https://regexr.com/7u89c to test the following regex:
      const blankCodeBlockRegex = /^$|^`{3,4}.*$/;
      const lineBefore = params.lines[lineNumber - 1] ?? "";
      const lineBeforeIsValid = blankCodeBlockRegex.test(lineBefore);
      const lineAfter = params.lines[lineNumber + 1] ?? "";
      const lineAfterIsValid = blankCodeBlockRegex.test(lineAfter);

      if (lineBeforeIsValid && lineAfterIsValid) {
        return;
      }

      const lineAfterIsTheNextHtmlTag = lineNumber + 1 === isolatedHtmlTagsLineNumbers[i + 1];
      let replacementText = params.lines[lineNumber];

      // .trim() !== "" prevents interference with MD009 whitespace fixer
      if (!lineBeforeIsValid && lineBefore.trim() !== "") {
        replacementText = `\n${replacementText}`;
      }
      if (!lineAfterIsValid && !lineAfterIsTheNextHtmlTag && lineAfter.trim() !== "") {
        replacementText = `${replacementText}\n`;
      }

      /**
       * lineNumber is params.lines index (0-indexed).
       * +1 required as file line numbers are 1-indexed.
       */
      onError({
        lineNumber: lineNumber + 1,
        detail: `\n  Expected blank lines/code block delimiters: { Before: 1, After: 1 }\n  Actual blank lines/code block delimiters: { Before: ${
          lineBeforeIsValid ? 1 : 0
        }, After: ${lineAfterIsValid ? 1 : 0} }\n`,
        context: params.lines[lineNumber],
        fixInfo: {
          deleteCount: params.lines[lineNumber].length,
          insertText: replacementText,
        },
      });
    });
  },
};
