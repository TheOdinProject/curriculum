// A bullet list is every token between and inclusive bullet_list_open to bullet_list_closed
function isolateBulletList(tokens) {
  tokens.filter((token, index, tokensArr) => {
    if (
      tokensArr[index - 1].type === "heading_open" &&
      /lesson overview/i.test(token.content)
    ) {

    }
  });
}

// A list item is every token between and inclusive list_item_open to list_item_close
function getListItemData(bulletPoint) {
  const contentIndex = bulletPoint.findIndex((el) => el.type === "inline")
  const contentToken = bulletPoint[contentIndex]
  const lineNumber = contentToken.lineNumber
  const contentText = contentToken.content.trim()
  const firstCharacter = contentText.at(1)
  const lastCharacter = contentText.at(-1)
  return {
    firstCharacter,
    lastCharacter,
    lineNumber,
  }
}

module.exports = {
  names: ["TOP008", "proper-punctuation"],
  description: "Lesson overview items should have proper punctuation",
  tags: ["content"],
  information: new URL(
    "https://github.com/TheOdinProject/curriculum/blob/main/markdownlint/docs/TOP008.md",
  ),
  function: function TOP008(params, onError) {
    const { tokens } = params.parsers.markdownit;
    // BulletPoint[]
    const bulletPoints = isolateBulletList(tokens);
    bulletPoints.forEach((bulletPoint) => {
      if (!getListItemData(bulletPoint)) {
        // throw error here
      }
    })
  },
};
