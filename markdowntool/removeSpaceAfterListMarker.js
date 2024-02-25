function removeSpaceAfterListMarker(lines) {
  lines.forEach((line) => {
    if (line.content.trim().startsWith('1. ')) {
      const lengthWithSpaces = line.content.trim().slice(2).length
      const lengthWithNoSpaces = line.content.trim().slice(2).trim().length
      const lengthOfSpaces = lengthWithSpaces - lengthWithNoSpaces;
      const startsIndex = line.content.indexOf('1.') + 2;
      const endsIndex = startsIndex + lengthOfSpaces - 1;
      const spacesToRemove = endsIndex - startsIndex;
      line.content = line.content.split('').toSpliced(startsIndex, spacesToRemove).join('');
    }
    if (line.content.trim().startsWith('- ')) {
      const lengthWithSpaces = line.content.trim().slice(1).length
      const lengthWithNoSpaces = line.content.trim().slice(1).trim().length
      const lengthOfSpaces = lengthWithSpaces - lengthWithNoSpaces;
      const startsIndex = line.content.indexOf('-') + 1;
      const endsIndex = startsIndex + lengthOfSpaces - 1;
      const spacesToRemove = endsIndex - startsIndex;
      line.content = line.content.split('').toSpliced(startsIndex, spacesToRemove).join('');
    }
  })
  return lines;
}

module.exports = { removeSpaceAfterListMarker };