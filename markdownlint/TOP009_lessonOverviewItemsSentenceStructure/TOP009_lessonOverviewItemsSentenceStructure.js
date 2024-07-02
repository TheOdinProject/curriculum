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

function getListItemData(bulletPoint) {
  const lineNumber = bulletPoint.lineNumber;
  const context = bulletPoint.content.trim();
  const firstCharacterIndex = 0
  const lastCharacterIndex = context.length - 1
  const firstCharacter = context.at(firstCharacterIndex);
  const lastCharacter = context.at(lastCharacterIndex);
  return {
    firstCharacterIndex,
    lastCharacterIndex,
    firstCharacter,
    lastCharacter,
    lineNumber,
    context,
  };
}

module.exports = {
  names: ["TOP009", "lesson-overview-items-sentence-structure"],
  description: "Lesson overview items should have proper punctuation",
  tags: ["content"],
  information: new URL(
    "https://github.com/TheOdinProject/curriculum/blob/main/markdownlint/docs/TOP009.md",
  ),
  function: function TOP009(params, onError) {
    const bulletPoints = isolateBulletList(params.tokens);
    bulletPoints.forEach((bulletPoint) => {
      const { firstCharacter, lastCharacter, lineNumber, context, firstCharacterIndex, lastCharacterIndex } =
        getListItemData(bulletPoint);
      const firstCharacterIsValid =
        firstCharacter === firstCharacter.toUpperCase();
      if (!firstCharacterIsValid) {
        onError({
          lineNumber,
          detail: "Lesson overview items must start with a capital letter",
          context,
          fixInfo: {
            lineNumber,
            editColumn: firstCharacterIndex,
            deleteCount: 1,
            insertText: firstCharacter.toUpperCase(),
          },
        });
      }

      const lastCharacterIsValid = lastCharacter === ".";
      if (!lastCharacterIsValid) {
        onError({
          lineNumber,
          detail: "Lesson overview items must end with a period.",
          context,
          fixInfo: {
            lineNumber,
            editColumn: lastCharacterIndex,
            deleteCount: 1,
            insertText: ".",
          },
        });
      }
    });
  },
};
