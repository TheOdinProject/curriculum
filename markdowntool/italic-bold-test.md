## Bold and Italic Text Replacement Test Cases

### Basic Bold and Italic

- Single underscores for italic: _italic_ should become _italic_.
- Double underscores for bold: **bold** should become **bold**.

### Adjacent to Punctuation

- Italic adjacent to punctuation: Hello,_world_! should become Hello,_world_!
- Bold adjacent to punctuation: Hello,**world**! should become Hello,**world**!

### Nested Formatting

- Nested italic in bold using underscores: **bold and _italic_** should become **bold and _italic_**
- Nested bold in italic using underscores: \_italic and **bold\_** should become \*italic and **bold\***

### Multiple Lines

- Italic across multiple lines with underscores:
  _This is
  italic text_
  should become
  _This is
  italic text_

- Bold across multiple lines with underscores:
  **This is
  bold text**
  should become
  **This is
  bold text**

### Mixed Formatting in a Single Line

- Mixed bold and italic: **bold** and _italic_ on the same line should become **bold** and _italic_ on the same line.
- Mixed bold, italic, and plain text: This is **bold**, this is _italic_, and this is plain should become This is **bold**, this is _italic_, and this is plain.

### Edge Cases

- Unmatched formatting characters should remain unchanged: \_italic and **bold should become \*italic and **bold.
- Escaped formatting characters should remain unchanged: \_not italic\_ and \_\_not bold\_\_ should remain \_not italic\_ and \_\_not bold\_\_.
- Formatting within code blocks should remain unchanged:

should remain unchanged since it's within a code block.

- Formatting within inline code should remain unchanged: `__bold__` and `_italic_` should remain unchanged.

### Complex Nested Formatting

- Complex nesting with different markers: _italic, **bold**, and **both**_ should become \*italic, **bold**, and **both\***
- Multiple nesting levels: **bold, \_italic, **bold again**, italic again\_** should become **bold, \*italic, **bold again**, italic again\***

### Punctuation and Spaces

- Bold and italic next to punctuation: (**bold**) and (_italic_)! should become (**bold**) and (_italic_)!
- No space between bold and italic markers: **bold\_**italic\_ should become **bold\***italic\*
