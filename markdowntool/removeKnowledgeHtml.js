function removeKnowledgeHtml(lines) {
  lines.forEach((line) => {
    if (line.content.includes("knowledge-check-link")) {
      const contentSplit = line.content.split("");
      const indexOfBracket = contentSplit.indexOf("<");
      contentSplit.splice(indexOfBracket, 1);
      const indexOne = contentSplit.indexOf("<");
      const indexTwo = contentSplit.indexOf(">");
      // Now finding the href=
      const indexOfHref = contentSplit.join("").indexOf("href=");
      const hrefString = contentSplit
        .join("")
        .slice(indexOfHref + 6, indexTwo - 1);
      const knowledgeString = contentSplit
        .join("")
        .slice(indexTwo + 1, indexOne);
      line.content = `- [${knowledgeString}](${hrefString})`;
    }
  });
  return lines;
}

module.exports = { removeKnowledgeHtml };
