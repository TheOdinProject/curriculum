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

function createErrorObject(lineNumber, detail, fixInfo = {}) {
  return {
    lineNumber,
    detail,
    fixInfo,
  };
}

function getListSectionErrors(sectionTokens, section) {
  const WHOLE_LINE = -1;
  const listSectionErrors = [];
  const listItemsName = `${section}${section.endsWith("s") ? "" : "s"}`;
  const tokensAfterHeading = sectionTokens.slice(
    sectionTokens.findIndex((token) => token.type === "heading_close") + 1
  );

  const listItemTokens = tokensAfterHeading.filter(
    (token) => token.type === "list_item_open"
  );
  const nestedListItemTokens = listItemTokens.filter(
    (token) => token.level > 1
  );
  nestedListItemTokens.forEach((nestedListItemToken) => {
    listSectionErrors.push(
      // We're not applying a fix because we can't always know whether just un-nesting the list
      // will resolve the issue. There may be entire list items that need to be removed as well.
      createErrorObject(
        nestedListItemToken.lineNumber,
        `The ${section} section must not contain nested lists.`
      )
    );
  });

  // https://regexr.com/80hjf to test following regex. Note that we don't test nested lists due to
  // the fact that whitespaces won't precede the token marker, e.g. "1.", in the token object
  const orderedListItemRegex = /^\d+\.\s*/;
  const orderedListItemTokens = listItemTokens.filter((token) =>
    orderedListItemRegex.test(token.line)
  );
  orderedListItemTokens.forEach((orderedListItemToken) => {
    listSectionErrors.push(
      createErrorObject(
        orderedListItemToken.lineNumber,
        `The ${section} section must not include any ordered lists.`,
        {
          lineNumber: orderedListItemToken.lineNumber,
          deleteCount:
            orderedListItemToken.line.match(orderedListItemRegex)[0].length,
          insertText: "- ",
        }
      )
    );
  });

  const defaultContentOpenTokenIndex = tokensAfterHeading.findIndex(
    (token) => token.line === listSectionsDefaultContent[section]
  );

  if (defaultContentOpenTokenIndex > 0) {
    const defaultContentToken =
      tokensAfterHeading[defaultContentOpenTokenIndex];
    listSectionErrors.push(
      createErrorObject(
        defaultContentToken.lineNumber,
        `Expected default section content to come immediately after the ${section} heading.`
      )
    );
  }
  if (defaultContentOpenTokenIndex === -1) {
    const sectionStartsWithList = tokensAfterHeading[0].line.startsWith("- ");
    const errorDetail = sectionStartsWithList
      ? `Expect default content to precede unordered list of ${listItemsName}: "${listSectionsDefaultContent[section]}"`
      : `Expected: "${listSectionsDefaultContent[section]}"; Actual: "${tokensAfterHeading[0].line}",`;
    let replacementText = listSectionsDefaultContent[section];

    if (sectionStartsWithList) {
      replacementText += `\n\n${tokensAfterHeading[0].line}`;
    }

    listSectionErrors.push(
      createErrorObject(tokensAfterHeading[0].lineNumber, errorDetail, {
        lineNumber: tokensAfterHeading[0].lineNumber,
        deleteCount: tokensAfterHeading[0].line.length,
        insertText: replacementText,
      })
    );
  }

  const tokensAfterFirstContent = tokensAfterHeading.slice(
    tokensAfterHeading.findIndex(
      (token, _index, arr) =>
        token.type === arr[0].type.replace("_open", "_close")
    ) + 1
  );
  const bulletListOpenTokenIndex = sectionTokens.findIndex(
    (token) => token.type === "bullet_list_open"
  );
  if (
    (defaultContentOpenTokenIndex === 0 && !tokensAfterFirstContent.length) ||
    bulletListOpenTokenIndex === -1
  ) {
    const isAdditionalResources =
      section === sectionsWithDefaultContent.additionalResources;
    const tokenLineNumber = (
      tokensAfterFirstContent[0] || tokensAfterHeading[0]
    ).lineNumber;
    const errorDetail = isAdditionalResources
      ? `Expected section to include unordered list item: "It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum."`
      : `Must include an unordered list of ${listItemsName} in the "${section}" section`;
    listSectionErrors.push(
      createErrorObject(
        tokenLineNumber,
        errorDetail,
        isAdditionalResources
          ? {
              lineNumber: !tokensAfterFirstContent.length
                ? tokenLineNumber + 1
                : tokenLineNumber,
              insertText:
                "\n- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.",
            }
          : {}
      )
    );
  }

  if (
    defaultContentOpenTokenIndex === 0 &&
    tokensAfterFirstContent.length &&
    !tokensAfterFirstContent[0].type.endsWith("_list_open")
  ) {
    listSectionErrors.push(
      createErrorObject(
        tokensAfterFirstContent[0].lineNumber,
        `Only an unordered list of ${listItemsName} can follow the default content.`,
        {
          lineNumber: tokensAfterFirstContent[0].lineNumber,
          deleteCount: WHOLE_LINE,
        }
      )
    );
  }

  const lastBulletListCloseIndex = sectionTokens.findLastIndex(
    (token) => token.type === "bullet_list_close"
  );

  if (
    bulletListOpenTokenIndex !== -1 &&
    lastBulletListCloseIndex !== sectionTokens.length - 1
  ) {
    const tokensAfterBulletListClose = sectionTokens.slice(
      lastBulletListCloseIndex + 1
    );

    listSectionErrors.push(
      createErrorObject(
        tokensAfterBulletListClose[0].lineNumber,
        `There should be no additional content after the unordered list of ${listItemsName}`,
        {
          lineNumber: tokensAfterBulletListClose[0].lineNumber,
          deleteCount: WHOLE_LINE,
        }
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
  parser: "markdownit",
  information: new URL(
    "https://github.com/TheOdinProject/curriculum/blob/main/markdownlint/docs/TOP003.md"
  ),
  function: function TOP003(params, onError) {
    const { tokens } = params.parsers.markdownit;
    const headingTokenIndices = tokens
      .filter((token) => token.type === "heading_open")
      .map((headingToken) => tokens.indexOf(headingToken));
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
