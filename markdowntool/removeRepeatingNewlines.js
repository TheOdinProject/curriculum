function removeRepeatingNewlines(lines) {
  return lines.filter((line, index) => {
    if (line.content.trim().length === 0) {
      return index === 0 ? true : line.content !== lines[index - 1].content;
    } else {
      return true;
    }
  });
}

module.exports = { removeRepeatingNewlines };
