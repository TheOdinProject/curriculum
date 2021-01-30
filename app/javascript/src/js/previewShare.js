import { encode, decode } from 'js-base64';

function generateLink(content) {
  // concatenating the host and pathname avoids issues if someone shares an updated preview link
  return `${window.location.host}${window.location.pathname}?content=${encodeURIComponent(content)}`;
}

function encodeContent(content) {
  return encode(content);
}

function decodeContent(content) {
  return decode(content);
}

export { generateLink, encodeContent, decodeContent };
