module.exports = {
  names: ["TOP008", "use-backticks-for-fenced-code-blocks"],
  description: "Fenced code blocks should use backticks instead of tildes",
  tags: ["code"],
  information: new URL(
    "https://github.com/TheOdinProject/curriculum/blob/main/markdownlint/docs/TOP008.md"
  ),
  function: function TOP008(params, onError) {
    const fencedCodeBlocks = params.lines.reduce((codeBlocks, currentLine, index) => {
      if (currentLine.trim().startsWith("~~~")) {
        codeBlocks.push({
          lineNumber: index + 1,
          text: currentLine.trim(),
          tildeCount: currentLine.lastIndexOf("~") + 1,
          startingColumn: currentLine.indexOf("~") + 1,
        });
      }

      return codeBlocks;
    }, []);

    fencedCodeBlocks.forEach((codeBlock) => {
      onError({
        lineNumber: codeBlock.lineNumber,
        detail: `Expected: "${"`".repeat(codeBlock.tildeCount)}"; Actual: "${"~".repeat(
          codeBlock.tildeCount
        )}"`,
        context: codeBlock.text,
        fixInfo: {
          lineNumber: codeBlock.lineNumber,
          editColumn: codeBlock.startingColumn,
          deleteCount: codeBlock.tildeCount,
          insertText: "`".repeat(codeBlock.tildeCount),
        },
      });
    });
  },
};
