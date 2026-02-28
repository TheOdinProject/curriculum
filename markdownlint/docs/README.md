# TOP Custom Markdownlint Rules

This directory contains documentation for our custom rules for linting Markdown files using the [markdownlint-cli2](https://github.com/DavidAnson/markdownlint-cli2) tool. These rules supplement the [default rules provided by markdownlint](https://github.com/DavidAnson/markdownlint/blob/main/doc/Rules.md) to enforce our [curriculum's layout style](https://github.com/TheOdinProject/curriculum/blob/main/LAYOUT_STYLE_GUIDE.md).

## Table of Contents

- [How to Contribute](#how-to-contribute)
- [Custom Rules](#custom-rules)
  - [File Structure](#file-structure)
  - [Rule Code](#rule-code)
  - [Tests](#tests)
  - [Test Utilities](#test-utilities)

## How to Contribute

Make sure you have read our [general contributing guide](https://github.com/TheOdinProject/.github/blob/main/CONTRIBUTING.md), as it contains information that is important for all of our repos.

This contributing guide assumes you have followed the instructions in the general contributing guide to fork and clone this curriculum repo.

If you have a suggestion for a new linting rule, please **do not** open a pull request (PR) directly. Instead, open an issue with the full proposal so the team can discuss it first.

## Custom Rules

### File Structure

Every custom rule should have its own directory inside `/markdownlint` (parent directory to this file), in the following format:

```text
TOPXXX_ruleName/
├── TOPXXX_ruleName.js
└── tests/
    ├── TOPXXX.test.js
    └── ...<any number of markdown test files>.md
```

It must also have a corresponding `TOPXXX.md` documentation file inside `/markdownlint/docs` (same directory as this file) that explains how the rule works, whether it includes auto-fix behaviour (and in what way), and the rationale behind the rule.

A path to the `TOPXXX_ruleName.js` file must also be added to the `customRules` array in the `.markdownlint-cli2.jsonc` configuration file in the root of this repo.

### Rule Code

Refer to [markdonwlint custom rule documentation](https://github.com/DavidAnson/markdownlint/blob/main/doc/CustomRules.md) for general information about how to write a custom rule.

Our custom rules must also ensure the following properties contain the following values:

- `names`: An array with two elements:
  - The rule code (e.g. `TOP001`)
  - The rule name in kebab-case (e.g. `descriptive-link-text-labels`)
- `parser`: Must be set to `markdownit`
- `information`: A `new URL()` object that links to the rule's documentation file

### Tests

Tests are run via [Node's built-in test runner](https://nodejs.org/api/test.html). All rules require the following:

- Any number of markdown files containing only violations of the respective rule. **These files must not include violations of other rules.**
- A markdown file containing no rule violations.
- A `.test.js` file containing tests that:
  - Show the rule links to the correct documentation file
  - Demonstrate the correct error output when linting markdown files with rule violations (will indirectly test for the correct rule name/description as they are included in the error output)
  - Demonstrate the file with no rule violations has no error output

For rules that contain auto-fix behavior, the following things are also required:

- Any number of markdown files that contain the intended "fixed" contents of other test markdown files (the intended result of running `npm run fix` on them)
- Tests that:
  - Show no error output from any "fixed" markdown files
  - Show fixing a test markdown file results in the same contents as the respective "fixed" markdown file

Tests can be run by running `npm run test`.

### Test Utilities

Two utility functions are provided in `/markdownlint/test_utils` for testing both linting and fixing: `getLintErrors` and `fixLintErrors`. For both of these, `require` them into the test file and call them with `__dirname` as an argument. These will each return an async function that's relative to the test file, so you only need to pass them paths relative to the test file.

- `getLintErrors` takes a string containing the relative path to a test markdown file, and returns a Promise that resolves to an array containing each violation's error output as a separate string.
- `fixLintErrors` takes a string containing the relative path to a test markdown file, and returns a Promise that resolves to a string containing the contents of the file after fixing all fixable violations.
