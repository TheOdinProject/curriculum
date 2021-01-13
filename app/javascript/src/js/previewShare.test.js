import { generateLink, encodeContent, decodeContent } from './previewShare';

describe('encodeContent', () => {
  it('content is correctly encoded to base64', () => {
    const buffer = Buffer.from('This is a test string!', 'utf-8');
    expect(encodeContent('This is a test string!')).toBe(buffer.toString('base64'));
  });

  it('content including numbers is correctly encoded to base64', () => {
    const buffer = Buffer.from('This is a 2nd test string!', 'utf-8');
    expect(encodeContent('This is a 2nd test string!')).toBe(buffer.toString('base64'));
  });

  it('content including special characters and new lines correctly encoded to base64', () => {
    const buffer = Buffer.from('This is a test string! \n # Next Title', 'utf-8');
    expect(encodeContent('This is a test string! \n # Next Title')).toBe(buffer.toString('base64'));
  });
});

describe('decodeContent', () => {
  it('content is correctly decoded from base64', () => {
    const buffer = Buffer.from('This is a test string!', 'utf-8').toString('base64');
    expect(decodeContent(buffer)).toBe('This is a test string!');
  });

  it('content including numbers is correctly decoded from base64', () => {
    const buffer = Buffer.from('This is a 2nd test string!', 'utf-8').toString('base64');
    expect(decodeContent(buffer)).toBe('This is a 2nd test string!');
  });

  it('content including special characters and new lines correctly decoded from base64', () => {
    const buffer = Buffer.from('This is a test string! \n # Next Title', 'utf-8').toString('base64');
    expect(decodeContent(buffer)).toBe('This is a test string! \n # Next Title');
  });
});

describe('generateLink', () => {
  const originalWindow = { ...window };
  const windowSpy = jest.spyOn(global, 'window', 'get');
  windowSpy.mockImplementation(() => ({
    ...originalWindow,
    location: {
      ...originalWindow.location,
      host: 'theodinproject.com',
      pathname: '/lessons/preview',
    },
  }));

  it('the correct link is generated', () => {
    const content = encodeContent('This is a test string!');
    expect(generateLink(content)).toBe(`theodinproject.com/lessons/preview?content=${content}`);
  });
});
