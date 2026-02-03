# The Odin Project Curriculum Contributing Guide

Thank you for expressing interest in contributing to The Odin Project (TOP) curriculum! Before continuing through this guide, be sure you've read our [general contributing guide](https://github.com/TheOdinProject/.github/blob/main/CONTRIBUTING.md), as it contains information that is important for all of our repos.

This contributing guide assumes you have followed the instructions in our general contributing guide to fork and clone our curriculum repo.

## Table of Contents

- [How to Contribute](#how-to-contribute)
- [Curriculum Linting](#curriculum-linting)
- [Adding Images to the Curriculum](#adding-images-to-the-curriculum)
- [Updating Ruby Version](#updating-ruby-version)

## How to Contribute

Please refer to our [general contributing guide](https://github.com/TheOdinProject/.github/blob/main/CONTRIBUTING.md) for details on the difference between simple and significant changes, and the expected process for handling each.

When it comes to opening a pull request (PR) to our curriculum, there are 2 main ways you can do so:

1. Click the "Improve on GitHub" link found at the end of each lesson. This will open the lesson file in its "edit" mode, allowing you to make any edits and submit a PR all through GitHub. This can be useful if you're new to contributions and want to make a simple change.
1. Follow the instructions from the general contributing guide to fork and clone this repo locally, and work from there. This is necessary if you need to edit multiple files as part of a single PR.

Regardless of the way you choose to open a PR, while working on an existing or a new lesson you **must** follow our [Layout Style Guide](https://github.com/TheOdinProject/curriculum/blob/main/LAYOUT_STYLE_GUIDE.md) to ensure the layout and formatting is consistent across our curriculum.

Before submitting a PR for any lesson, you must also use our [Lesson Preview Tool](https://www.theodinproject.com/lessons/preview) to ensure the lesson Markdown is correctly formatted and rendering properly.

## Curriculum Linting

> [!NOTE]
> For information about contributing to our custom linting rules, please read the [custom markdown linting contributing guide](./markdownlint/docs/README.md).

To help enforce the layout specified in our layout style guide, we use [markdownlint](https://github.com/DavidAnson/markdownlint). Whenever a PR is opened or has updates made to it, a workflow will run to check any files changed in the PR against common rules as well as custom rules specific to TOP. To make the workflow easier, we also strongly suggest that users who have a local clone run this linter locally before committing any changes. There are 2 ways you can do so:

1. Install the [Markdownlint VSCode Plugin](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint). This plugin will automatically pick up our markdownlint configuration and flag issues with a squiggly underline.
1. Install the `markdownlint-cli2` dependency. This will require you to have installed Node, which we cover in our Foundations path. Simply run `npm install` within the directory of your curriculum clone and you can run one of our npm scripts to easily lint or fix files. Note that running these scripts without a supplied file path will result in help documentation being output to the terminal.
    - Lint a file: `npm run lint -- "./path/to/file"`
    - Autofix a file: `npm run fix -- "./path/to/file"`

> [!IMPORTANT]
> npm scripts always run from the root of the curriculum repo (the same location as this file and `package.json`). Therefore, you *must* provide the full lesson/project file path relative to the repo root, even if your terminal is inside a subdirectory (such as the same directory as the lesson file).

> [!TIP]
> In some cases, you may need to run a fix script more than once to catch and fix all fixable errors. This typically occurs when a line has multiple errors affecting the same parts and fix actions collide, so Markdownlint only applies some of the fixes.

> [!NOTE]
> With either of these two methods, keep in mind that not all issues that get flagged will have an autofix available. Some rules require fixes that are more dependent on context and cannot - and should not - be automatically fixed, such as our custom rule `TOP001` for descriptive link text.
>
> The following markdownlint rules are at least partially fixable via the `fix` script:
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
> - [TOP012](https://github.com/TheOdinProject/curriculum/blob/main/markdownlint/docs/TOP012.md) note-box-headings

## Adding Images to the Curriculum

Adding images to the curriculum is a two-step process, involving two PRs. For a general overview, you need to:

1. Upload the image(s) to the repository.
1. Create `statically.io` links to the images and add those links to the appropriate lesson(s).

### Uploading Images to the Repository

1. Have a copy of the image you want to upload on your local machine.
1. If it doesn’t already exist, create a directory with the same name in the same directory as the lesson you want to add an image to.
1. If it doesn’t already exist, create an `imgs` directory inside of the directory you made in the previous step.
1. Add your image to the directory you made in step 3, naming it the order it appears on the page starting from 00 (i.e. the second image in a lesson will be `01.png` (or whatever extension)). If replacing an image, just replace the appropriate image file.
1. PR the addition of the image(s). Here is an [example PR](https://github.com/TheOdinProject/curriculum/pull/22421) where this process was followed.

### Creating Statically Links

1. Go to the PR that added the image(s) to the repo.
1. Right-click the commit ID where it was merged and select `copy link`.

   ![The commit ID is a random looking seven digit string that will appear like a message in the PR when your PR is merged.](https://cdn.statically.io/gh/wise-king-sullyman/curriculum/81577535181eae1bbaac066c37e304475af22855/images/Add-Images-Instructions/Click-Commit-ID.png)
1. Go to https://wise-king-sullyman.github.io/better-statically-converter-react/
1. Paste the URL you copied into the text box on the main screen of that site, then hit Enter.
1. The site will generate the statically CDN link to each image that was merged into the curriculum with that PR. You can click each link to auto-copy that link to your clipboard.
1. Use each of these links to link to your desired images in the curriculum content you’re editing/adding.
1. PR the addition of the image links (and any other content you’ve added/changed in the lesson).

## Updating Ruby Version

If you want to update the Ruby language version installed in the [Ruby Installation lesson](https://github.com/TheOdinProject/curriculum/blob/main/ruby/introduction/installing_ruby.md), there are a few additional changes that may need to happen:

1. Update the version number in the `.ruby-version` file in the following repos:
   - [custom_enumerable_project](https://github.com/TheOdinProject/custom_enumerable_project)
   - [ruby_testing](https://github.com/TheOdinProject/ruby_testing)
1. Ruby uses [semver](https://en.wikipedia.org/wiki/Software_versioning#Semantic_versioning) for its versioning, where the first digit is a 'major' version, the second digit is a 'minor' version, and the third digit is a 'patch' version. **If you're updating the installation to a Ruby version that bumps the major or minor digits, then the documentation links throughout the Ruby course will need to be updated.** They use a URL like `https://docs.ruby-lang.org/en/x.y` where `x` and `y` digits denote the major and minor versions respectively. You'll need to find all the existing documentation links and replace them to reference the new version. You can do this through using your editor's global find and replace utility or through the command line. An example command that would update the docs from 3.3 to 3.4 if run from the curriculum root:

   ```bash
   find . -type f -exec sed -i 's+docs.ruby-lang.org/en/3.3+docs.ruby-lang.org/en/3.4+g' {} +
   ```

1. Although not strictly required, we do like to have the version of Ruby used on the main site match the version that's used in the curriculum. If they don't match and you're comfortable working in a Rails app, feel free to put in a PR to the [main site repo](https://github.com/TheOdinProject/theodinproject) that bumps the Ruby version to what you're changing it to. If you're not experienced with Rails, you can open an issue instead and another contributor will pick it up.
