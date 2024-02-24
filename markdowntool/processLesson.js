import { blankLinesCode } from "./blankLinesCode";
import { blankLinesHeadings } from "./blankLinesHeadings";
import { blankLinesLists } from "./blankLinesLists";
import { correctCodeBlocks } from "./correctCodeBlocks";
import { correctOrderedList } from "./correctOrderedList";
import { correctUnorderedList } from "./correctUnorderedList";
import { sectionsDefaultContent } from "./defaultSectionContent";
import { formatStartAndEnd } from "./formatStartAndEnd";
import { lessonIntoArrayOfLines } from "./lessonIntoArrayOfLines";
import { removeRepeatingNewlines } from "./removeRepeatingNewlines";
import removeTrailingSpaces from "./removeTrailingSpaces";
import { getLesson, updateLesson } from "./updateLesson";

async function processLesson(filePath) {
  const lesson = getLesson(filePath);
  let lines = await lessonIntoArrayOfLines(lesson);
  // 10 stages
  lines = blankLinesHeadings(lines);
  lines = correctCodeBlocks(lines);
  lines = correctOrderedList(lines);
  lines = correctUnorderedList(lines);
  lines = removeTrailingSpaces(lines);
  lines = blankLinesCode(lines);
  lines = formatStartAndEnd(lines);
  lines = sectionsDefaultContent(lines);
  lines = blankLinesLists(lines);
  lines = removeRepeatingNewlines(lines);
  updateLesson(lesson, lines);
}

export { processLesson };
