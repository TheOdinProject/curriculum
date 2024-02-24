function removeTrailingSpaces(lines) {
  lines.forEach((line) => {
    line.content = line.content.trimEnd();
  });
  return lines;
}

export default { removeTrailingSpaces };
