// A bullet list is every token between and inclusive bullet_list_open to bullet_list_closed
function isolateBulletList(tokens) {
  const bulletList = [];
  let inBulletList = false;
  let inLessonOverview = false;
  tokens.forEach((token, index, tokensArr) => {
    if (
      tokensArr[index - 1]?.type === "heading_open" &&
      /lesson overview/i.test(token.content)
    ) {
      inLessonOverview = true;
    } else if (token.type === "bullet_list_open") {
      inBulletList = true;
    } else if (tokensArr[index - 1]?.type === "bullet_list_close") {
      inLessonOverview = false;
      inBulletList = false;
    }

    if (inBulletList && inLessonOverview) {
      bulletList.push(token);
    }
  });
  // Only consider tokens that have text in them.
  return bulletList.filter((token) => token.type === "inline");
}

// A list item is every token between and inclusive list_item_open to list_item_close
function getListItemData(bulletPoint) {
  const lineNumber = bulletPoint.lineNumber;
  const context = bulletPoint.content.trim();
  const firstCharacter = context.at(0);
  const lastCharacter = context.at(-1);
  return {
    firstCharacter,
    lastCharacter,
    lineNumber,
    context,
  };
}

module.exports = {
  names: ["TOP009", "lessonOverviewItemsSentenceStructure"],
  description: "Lesson overview items should have proper punctuation",
  tags: ["content"],
  information: new URL(
    "https://github.com/TheOdinProject/curriculum/blob/main/markdownlint/docs/TOP009.md",
  ),
  function: function TOP008(params, onError) {
    const bulletPoints = isolateBulletList(params.tokens);
    bulletPoints.forEach((bulletPoint) => {
      const { firstCharacter, lastCharacter, lineNumber, context } =
        getListItemData(bulletPoint);
      const firstCharacterIsValid =
        firstCharacter === firstCharacter.toUpperCase();
      if (!firstCharacterIsValid) {
        onError({
          lineNumber,
          detail: "Lesson overview items should start with a capital letter",
          context,
          fixInfo: {
            lineNumber,
            editColumn: 2,
            deleteCount: 1,
            insertText: firstCharacter.toUpperCase(),
          },
        });
      }
      const lastCharacterIsValid = lastCharacter === ".";
      if (!lastCharacterIsValid) {
        onError({
          lineNumber,
          detail: "Lesson overview items should end with a period.",
          context,
          fixInfo: {
            lineNumber,
            editColumn: context.length,
            deleteCount: 1,
            insertText: ".",
          },
        });
      }
    });
  },
};
