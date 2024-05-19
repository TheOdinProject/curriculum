module.exports = {
  names: ["TOP008", "use-backticks-for-fenced-code-blocks"],
  description: "Fenced code blocks should use backticks instead of tildes",
  tags: ["code"],
  parser: "markdownit",
  information: new URL(
    "https://github.com/TheOdinProject/curriculum/blob/main/markdownlint/docs/TOP008.md"
  ),
  function: function TOP008(params, onError) {
    const fencedCodeBlocks = params.lines.reduce((codeBlocks, currentLine, index) => {
      const trimmedLine = currentLine.trim();

      if (trimmedLine.startsWith("~~~")) {
        codeBlocks.push({
          lineNumber: index + 1,
          text: currentLine,
          tildeCount: trimmedLine.lastIndexOf("~") + 1,
          startingColumn: currentLine.indexOf("~") + 1,
        });
      }

      return codeBlocks;
    }, []);

    fencedCodeBlocks.forEach((codeBlock) => {
      const backtickReplacement = "`".repeat(codeBlock.tildeCount);

      onError({
        lineNumber: codeBlock.lineNumber,
        detail: `Expected: "${backtickReplacement}"; Actual: "${"~".repeat(
          codeBlock.tildeCount
        )}"`,
        context: codeBlock.text,
        fixInfo: {
          lineNumber: codeBlock.lineNumber,
          editColumn: codeBlock.startingColumn,
          deleteCount: codeBlock.tildeCount,
          insertText: backtickReplacement,
        },
      });
    });
  },
};
