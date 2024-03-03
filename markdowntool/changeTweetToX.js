function changeTweetToX(lines) {
  lines.forEach((line) => {
    line.content = line.content.replace(/\b(?:tweet)\b/, "post")
    line.content = line.content.replace(/\b(?:Tweet)\b/, "Post")
    line.content = line.content.replace(/\b(?:Twitter)\b/, "X")
    line.content = line.content.replace(/\b(?:twitter)\b/, "X")
  })
  return lines;
}

module.exports = { changeTweetToX };