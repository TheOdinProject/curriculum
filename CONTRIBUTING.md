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
