const { blankLinesCode } = require("./blankLinesCode");
const { blankLinesHeadings } = require("./blankLinesHeadings");
const { blankLinesLists } = require("./blankLinesLists");
const { boldAndItalic } = require("./correctBoldAndItalic");
const { correctCodeBlocks } = require("./correctCodeBlocks");
const { correctOrderedList } = require("./correctOrderedList");
const { correctUnorderedList } = require("./correctUnorderedList");
const { sectionsDefaultContent } = require("./defaultSectionContent");
const { formatStartAndEnd } = require("./formatStartAndEnd");
const { lessonIntoArrayOfLines } = require("./lessonIntoArrayOfLines");
const { removeRepeatingNewlines } = require("./removeRepeatingNewlines");
const { removeTrailingSpaces } = require("./removeTrailingSpaces");
const { unindentLists } = require("./unindentLists");
const { getLesson, updateLesson } = require("./updateLesson");

async function processLesson(filePath) {
  const lesson = getLesson(filePath);
  let lines = await lessonIntoArrayOfLines(lesson);
  lines = blankLinesHeadings(lines);
  lines = correctCodeBlocks(lines);
  lines = correctOrderedList(lines);
  lines = correctUnorderedList(lines);
  lines = removeTrailingSpaces(lines);
  lines = blankLinesCode(lines);
  lines = formatStartAndEnd(lines);
  lines = sectionsDefaultContent(lines);
  lines = blankLinesLists(lines);
  lines = boldAndItalic(lines);
  lines = unindentLists(lines);
  lines = removeRepeatingNewlines(lines);
  updateLesson(lesson, lines);
}

module.exports = { processLesson };
