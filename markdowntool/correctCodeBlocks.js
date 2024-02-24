function correctCodeBlocks(lines) {
  lines.forEach((line) => {
    line.content = line.content.replace("~~~", "```");
  });
  return lines;
}

module.exports = { correctCodeBlocks };
