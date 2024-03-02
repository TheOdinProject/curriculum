const sectionsWithDefaultContent = {
  lessonOverview: "lesson overview",
  assignment: "assignment",
  knowledgeCheck: "knowledge check",
  additionalResources: "additional resources",
};
const listSectionsDefaultContent = {
  [sectionsWithDefaultContent.lessonOverview]:
    "This section contains a general overview of topics that you will learn in this lesson.",
  [sectionsWithDefaultContent.knowledgeCheck]:
    "The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.",
  [sectionsWithDefaultContent.additionalResources]:
    "This section contains helpful links to related content. It isn't required, so consider it supplemental.",
};

function createErrorObject(lineNumber, detail) {
  return {
    lineNumber,
    detail,
  };
}

function getListSectionErrors(sectionTokens, section) {
  const listSectionErrors = [];
  const listItemsName = `${section}${section.endsWith("s") ? "" : "s"}`;
  const tokensAfterHeading = sectionTokens.slice(
    sectionTokens.findIndex((token) => token.type === "heading_close") + 1
  );

  const hasDefaultContent =
    tokensAfterHeading[0].line === listSectionsDefaultContent[section];
  if (!hasDefaultContent && tokensAfterHeading[0].type !== "bullet_list_open") {
    listSectionErrors.push(
      createErrorObject(
        tokensAfterHeading[0].lineNumber,
        `Expected: "${listSectionsDefaultContent[section]}"; Actual: "${tokensAfterHeading[0].line}"`
      )
    );
  }
  if (!hasDefaultContent && tokensAfterHeading[0].type === "bullet_list_open") {
    listSectionErrors.push(
      createErrorObject(
        tokensAfterHeading[0].lineNumber,
        `Expected default section content to precede the unordered list of ${listItemsName}: "${listSectionsDefaultContent[section]}"`
      )
    );
  }

  const tokensAfterFirstContent = tokensAfterHeading.slice(
    tokensAfterHeading.findIndex(
      (token, _index, arr) =>
        token.type === arr[0].type.replace("_open", "_close")
    ) + 1
  );
  if (
    hasDefaultContent &&
    tokensAfterFirstContent[0].type !== "bullet_list_open"
  ) {
    listSectionErrors.push(
      createErrorObject(
        tokensAfterFirstContent[0].lineNumber,
        `Only an unordered list of ${listItemsName} should follow the default content.`
      )
    );
  }

  const bulletListOpenTokenIndex = sectionTokens.findIndex(
    (token) => token.type === "bullet_list_open"
  );
  if (bulletListOpenTokenIndex === -1) {
    const errorDetail =
      section === sectionsWithDefaultContent.additionalResources
        ? `Expected section to include unordered list item: "It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum."`
        : `Must include an unordered list of ${listItemsName} in the "${section}" section`;
    listSectionErrors.push(
      createErrorObject(
        (tokensAfterFirstContent[0] || tokensAfterHeading[0]).lineNumber,
        errorDetail
      )
    );
  }

  const firstBulletListCloseIndex = sectionTokens.findIndex(
    (token) => token.type === "bullet_list_close"
  );
  const lastBulletListCloseIndex = sectionTokens.findLastIndex(
    (token) => token.type === "bullet_list_close"
  );
  if (firstBulletListCloseIndex !== lastBulletListCloseIndex) {
    const tokensUpToBulletListClose = sectionTokens.slice(
      bulletListOpenTokenIndex,
      firstBulletListCloseIndex
    );

    listSectionErrors.push(
      createErrorObject(
        tokensUpToBulletListClose.findLast((token) => token.lineNumber)
          .lineNumber,
        `There should not be nested lists of ${listItemsName}`
      )
    );
  }

  if (
    bulletListOpenTokenIndex !== -1 &&
    lastBulletListCloseIndex !== sectionTokens.length - 1
  ) {
    const tokensAfterBulletListClose = sectionTokens.slice(
      firstBulletListCloseIndex
    );

    listSectionErrors.push(
      createErrorObject(
        tokensAfterBulletListClose.find((token) => token.lineNumber).lineNumber,
        `There should be no additional content after the unordered list of ${listItemsName}`
      )
    );
  }

  return listSectionErrors;
}

function getAssignmentSectionErrors(sectionTokens) {
  const assignmentErrors = [];
  const divBlockTokens = sectionTokens.filter(
    (token) => token.type === "html_block" && token.content.startsWith("<div")
  );
  const hasAssignmentDiv = divBlockTokens.some(
    (token) =>
      token.content.includes(`class="lesson-content__panel"`) &&
      token.content.includes(`markdown="1"`)
  );
  if (!divBlockTokens || !hasAssignmentDiv) {
    assignmentErrors.push(
      createErrorObject(
        sectionTokens[0].lineNumber,
        `Assignment sections must include an HTML div element with class="lesson-content__panel" and markdown="1" attributes`
      )
    );
  }

  return assignmentErrors;
}

module.exports = {
  names: ["TOP003", "default-section-content"],
  description: "Sections have default content",
  tags: ["content"],
  function: function TOP003(params, onError) {
    const { tokens } = params.parsers.markdownit;
    const headingTokenIndices = tokens
      ?.filter((token) => token.type === "heading_open")
      .map((headingToken) => tokens?.indexOf(headingToken));
    const totalErrors = [];

    headingTokenIndices.forEach(
      (tokenIndexValue, arrIndex, tokenIndicesArr) => {
        const headingContent = tokens[tokenIndexValue].line
          .replace(/\#+\s/g, "")
          .toLowerCase();
        if (
          !Object.values(sectionsWithDefaultContent).includes(headingContent)
        ) {
          return;
        }

        const tokensBetweenHeadings = tokens.slice(
          tokenIndexValue,
          tokenIndicesArr[arrIndex + 1]
        );

        switch (headingContent) {
          case sectionsWithDefaultContent.lessonOverview:
          case sectionsWithDefaultContent.knowledgeCheck:
          case sectionsWithDefaultContent.additionalResources:
            totalErrors.push(
              ...getListSectionErrors(tokensBetweenHeadings, headingContent)
            );
            break;
          case sectionsWithDefaultContent.assignment:
            totalErrors.push(
              ...getAssignmentSectionErrors(tokensBetweenHeadings)
            );
            break;
        }
      }
    );

    totalErrors.forEach((error) => {
      onError(error);
    });
  },
};
