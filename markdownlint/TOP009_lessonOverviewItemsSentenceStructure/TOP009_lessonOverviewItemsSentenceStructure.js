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
  names: ["TOP009", "lesson-overview-items-sentence-structure"],
  description:
    "Lesson overview items must be statements, not questions, and must begin with a capital letter and end with a period.",
  tags: ["content"],
  information: new URL(
    "https://github.com/TheOdinProject/curriculum/blob/main/markdownlint/docs/TOP009.md",
  ),
  function: function TOP009(params, onError) {
    const bulletPoints = isolateBulletList(params.tokens);
    bulletPoints.forEach((bulletPoint) => {
      const { firstCharacter, lastCharacter, lineNumber, context } =
        getListItemData(bulletPoint);
      const firstCharacterIsValid =
        firstCharacter === firstCharacter.toUpperCase();
      const lastCharacterIsValid = lastCharacter === ".";
      if (!firstCharacterIsValid || !lastCharacterIsValid) {
        onError({
          lineNumber: lineNumber,
          detail:
            "Lesson overview items must be statements, not questions, and must begin with a capital letter and end with a period.",
          context: context,
        });
      }
    });
  },
};
