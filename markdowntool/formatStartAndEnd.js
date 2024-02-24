import { Line } from "./line";

function formatStartAndEnd(lines) {
  while (lines[0].content.trim().length === 0) {
    lines.shift();
  }
  while (lines.at(-1).content.trim().length === 0) {
    lines.pop();
  }
  lines.push(new Line());
  return lines;
}

export { formatStartAndEnd };
