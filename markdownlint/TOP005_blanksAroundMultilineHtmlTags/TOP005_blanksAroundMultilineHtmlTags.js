module.exports = {
    names: ['TOP005', 'blanks-around-multiline-html-tags'],
    description: 'Multiline HTML tags should be surrounded by blank lines',
    tags: ['html', 'blanks'],
    information: new URL(
        'https://github.com/TheOdinProject/curriculum/blob/main/markdownlint/docs/TOP005.md'
    ),
    function: function TOP005(params, onError) {
        /**
         * html_block tokens are only separated once you hit a blank line.
         *
         * <div>
         * foo
         * </div>
         * <div>
         * bar
         * </div>
         *
         * gets treated as a single html_block with the contents:
         * `<div>\nfoo\n</div>\n<div>\nbar\n</div>\n`
         * which will require splitting.
         *
         * Therefore, manual matching is more straightforward than relying on tokens.
         */
        const isolatedHtmlTagsLineNumbers = params.lines.reduce(
            (lineNumbers, currentLineText, currentLineNumber) => {
                if (/^<\/?[^>]*>$/.test(currentLineText)) {
                    lineNumbers.push(currentLineNumber);
                }
                return lineNumbers;
            },
            []
        );

        isolatedHtmlTagsLineNumbers.forEach((lineNumber) => {
            const lineBeforeTagIsEmpty = params.lines[lineNumber - 1] === '';
            const lineAfterTagIsEmpty = params.lines[lineNumber + 1] === '';
            if (lineBeforeTagIsEmpty && lineAfterTagIsEmpty) return;

            onError({
                /**
                 * lineNumber is params.lines index (0-indexed).
                 * +1 required as file line numbers are 1-indexed.
                 */
                lineNumber: lineNumber + 1,
                detail: `Expected: { Before: 1, After: 1 }; Actual: { Before: ${
                    lineBeforeTagIsEmpty ? 1 : 0
                }, After: ${lineAfterTagIsEmpty ? 1 : 0} }`,
                context: params.lines[lineNumber],
            });
        });
    },
};
