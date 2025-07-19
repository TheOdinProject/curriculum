# The Odin Project Curriculum Contributing Guide

Thank you for expressing interest in contributing to The Odin Project (TOP) curriculum! Before continuing through this guide, be sure you've read our [general contributing guide](https://github.com/TheOdinProject/.github/blob/main/CONTRIBUTING.md), as it contains information that is important for all of our repos.

This contributing guide assumes you have followed the instructions in our general contributing guide to fork and clone our curriculum repo.

## Table of Contents

- [How to Contribute](#how-to-contribute)
- [Curriculum Linting](#curriculum-linting)

## How to Contribute

There are 2 main ways you can contribute to our curriculum:

1. If you're new to contributing to open-source, only need to edit 1 file, or if you just want to make a really quick pull request (PR), you can click the "Improve this lesson on GitHub" link found at the end of each lesson. This will open the lesson file in its "edit" mode, allowing you to make any edits and submit a PR all through GitHub.
1. If you're more experienced with contributing or need to edit more than 1 file, you can follow our instructions on [setting up a local clone](https://github.com/TheOdinProject/.github/blob/main/CONTRIBUTING.md) from our general contributing guide. You should also read the sections that follow on how to open a PR.

Regardless of the way you choose to open a PR, while working on an existing or a new lesson you **must** follow our [Layout Style Guide](https://github.com/TheOdinProject/curriculum/blob/main/LAYOUT_STYLE_GUIDE.md) to ensure the layout and formatting is consistent across our curriculum.

Before submitting a PR for any lesson, you must also use our [Lesson Preview Tool](https://www.theodinproject.com/lessons/preview) to ensure the lesson Markdown is correctly formatted and rendering properly.

## Curriculum Linting

To help enforce the layout specified in our layout style guide, we use [markdownlint](https://github.com/DavidAnson/markdownlint). Whenever a PR is opened or has updates made to it, a workflow will run to check any files changed in the PR against common rules as well as custom rules specific to TOP. To make the workflow easier, we also strongly suggest that users who have a local clone run this linter locally before committing any changes. There are 2 ways you can do so:

1. Install the [Markdownlint VSCode Plugin](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint). This plugin will automatically pick up our main configuration and flag issues with a squiggly underline. Note that the plugin will not currently flag issues with the structure of lessons or projects.
1. Install the `markdownlint-cli2` dependency. This will require you to have installed Node, which we cover in our Foundations path. Simply run `npm install` within the directory of your curriculum clone and you can run one of our 4 scripts to easily lint or fix files. Note that running these scripts without a supplied file path will result in help documentation being output to the terminal.
    - Lint lessons: `npm run lint:lesson -- "./path/to/lesson"`
    - Autofix lessons: `npm run fix:lesson -- "./path/to/lesson"`
    - Lint projects: `npm run lint:project -- "./path/to/project"`
    - Autofix projects: `npm run fix:project -- "./path/to/project"`

> [!IMPORTANT]
> npm scripts always run from the root of the curriculum repo (the same location as this file and `package.json`). Therefore, you *must* provide the full lesson/project file path relative to the repo root, even if your terminal is inside a subdirectory (such as the same directory as the lesson file).

> [!TIP]
> In some cases, you may need to run a fix script more than once to catch and fix all fixable errors. This typically occurs when a line has multiple errors affecting the same parts and fix actions collide, so Markdownlint only applies some of the fixes.

> [!NOTE]
> With either of these two methods, keep in mind that not all issues that get flagged will have an autofix available. Some rules require fixes that are more dependent on context and cannot - and should not - be automatically fixed, such as our custom rule `TOP001` for descriptive link text.
>
> The following markdownlint rules are at least partially fixable via the appropriate `fix:*` script:
>
> - [MD004](https://github.com/DavidAnson/markdownlint/blob/main/doc/md004.md) ul-style
> - [MD005](https://github.com/DavidAnson/markdownlint/blob/main/doc/md005.md) list-indent
> - [MD007](https://github.com/DavidAnson/markdownlint/blob/main/doc/md007.md) ul-indent
> - [MD009](https://github.com/DavidAnson/markdownlint/blob/main/doc/md009.md) no-trailing-spaces
> - [MD010](https://github.com/DavidAnson/markdownlint/blob/main/doc/md010.md) no-hard-tabs
> - [MD011](https://github.com/DavidAnson/markdownlint/blob/main/doc/md011.md) no-reversed-links
> - [MD012](https://github.com/DavidAnson/markdownlint/blob/main/doc/md012.md) no-multiple-blanks
> - [MD014](https://github.com/DavidAnson/markdownlint/blob/main/doc/md014.md) commands-show-output
> - [MD018](https://github.com/DavidAnson/markdownlint/blob/main/doc/md018.md) no-missing-space-atx
> - [MD019](https://github.com/DavidAnson/markdownlint/blob/main/doc/md019.md) no-multiple-space-atx
> - [MD022](https://github.com/DavidAnson/markdownlint/blob/main/doc/md022.md) blanks-around-headings
> - [MD023](https://github.com/DavidAnson/markdownlint/blob/main/doc/md023.md) headings-start-left
> - [MD026](https://github.com/DavidAnson/markdownlint/blob/main/doc/md026.md) no-trailing-punctuation
> - [MD027](https://github.com/DavidAnson/markdownlint/blob/main/doc/md027.md) no-multiple-space-blockquote
> - [MD028](https://github.com/DavidAnson/markdownlint/blob/main/doc/md028.md) no-blanks-blockquote
> - [MD030](https://github.com/DavidAnson/markdownlint/blob/main/doc/md030.md) list-marker-space
> - [MD031](https://github.com/DavidAnson/markdownlint/blob/main/doc/md031.md) blanks-around-fences
> - [MD032](https://github.com/DavidAnson/markdownlint/blob/main/doc/md032.md) blanks-around-lists
> - [MD037](https://github.com/DavidAnson/markdownlint/blob/main/doc/md037.md) no-space-in-emphasis
> - [MD038](https://github.com/DavidAnson/markdownlint/blob/main/doc/md038.md) no-space-in-code
> - [MD039](https://github.com/DavidAnson/markdownlint/blob/main/doc/md039.md) no-space-in-links
> - [MD044](https://github.com/DavidAnson/markdownlint/blob/main/doc/md044.md) proper-names
> - [MD047](https://github.com/DavidAnson/markdownlint/blob/main/doc/md047.md) single-trailing-newline
> - [MD049](https://github.com/DavidAnson/markdownlint/blob/main/doc/md049.md) emphasis-style
> - [MD050](https://github.com/DavidAnson/markdownlint/blob/main/doc/md050.md) strong-style
> - [MD053](https://github.com/DavidAnson/markdownlint/blob/main/doc/md053.md) link-image-reference-definitions
> - [TOP002](https://github.com/TheOdinProject/curriculum/blob/main/markdownlint/docs/TOP002.md) no-code-in-headings
> - [TOP003](https://github.com/TheOdinProject/curriculum/blob/main/markdownlint/docs/TOP003.md) default-section-content
> - [TOP005](https://github.com/TheOdinProject/curriculum/blob/main/markdownlint/docs/TOP005.md) blanks-around-multiline-html-tags
> - [TOP006](https://github.com/TheOdinProject/curriculum/blob/main/markdownlint/docs/TOP006.md) full-fenced-code-language
> - [TOP007](https://github.com/TheOdinProject/curriculum/blob/main/markdownlint/docs/TOP007.md) use-markdown-links
> - [TOP008](https://github.com/TheOdinProject/curriculum/blob/main/markdownlint/docs/TOP008.md) use-backticks-for-fenced-code-blocks
> - [TOP010](https://github.com/TheOdinProject/curriculum/blob/main/markdownlint/docs/TOP010.md) use-lazy-numbering
> - [TOP011](https://github.com/TheOdinProject/curriculum/blob/main/markdownlint/docs/TOP011.md) heading-indentation
