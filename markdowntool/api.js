// If you want to customize the tool, you can do so here

const legacyData = {
  codeBlock: "~~~",
  unorderedListFormat: ["*", " "],
};

const data = {
  codeBlock: "```",
  headingTypes: ["###", "####", "#####"],
  unorderedListFormat: ["-", " "],
  orderedListFormat: ["1", ".", " "],
  fileType: ".md",
  encoding: "utf8",
  defaultContent: {
    "Lesson overview":
      "This section contains a general overview of topics that you will learn in this lesson.",
    "Knowledge check":
      "The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.",
    "Additional resources":
      "This section contains helpful links to related content. It isn't required, so consider it supplemental.",
  },
};

module.exports = { data, legacyData };
