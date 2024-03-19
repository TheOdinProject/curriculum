function h3headings(lines) {
  lines.forEach((line, index) => {
    if (lines[index - 1] && lines[index + 1]) {
      // console.log(line);
    const emptyAbove = lines[index - 1].content.trim().length === 0
    const emptyBelow = lines[index + 1].content.trim().length === 0
    const isEmphasizedHeading = line.content.trim().startsWith('**#') && line.content.trim().endsWith('**')

    if (emptyAbove && emptyBelow && isEmphasizedHeading) {
      line.content = '##### '.concat(line.content.trim().slice(3, -2));
    }
  }
  })
  return lines;
}

module.exports = { h3headings };