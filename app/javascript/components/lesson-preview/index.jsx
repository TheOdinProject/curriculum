import React, { useState, useEffect } from 'react';
import {
  Tab, Tabs, TabList, TabPanel,
} from 'react-tabs';
import Prism from 'prismjs';

import LessonContentInput from './components/lesson-content-input';
import LessonContentPreview from './components/lesson-content-preview';
import axios from '../../src/js/axiosWithCsrf';

import 'react-tabs/style/react-tabs.css';

import { generateLink, encodeContent, decodeContent } from '../../src/js/previewShare';

const LessonPreview = () => {
  const [content, setContent] = useState('');
  const [convertedContent, setConvertedContent] = useState('');
  const [copied, setCopied] = useState(false);

  const fetchLessonPreview = async () => {
    const response = await axios.post('/lessons/preview', { content });

    if (response.status === 200) {
      setConvertedContent(response.data.content);
    }
  };

  const handleClick = () => {
    const encodedContent = encodeContent(content);
    const link = generateLink(encodedContent);
    navigator.clipboard.writeText(link).then(() => setCopied(true));
  };

  useEffect(() => {
    Prism.highlightAll();
  }, [convertedContent]);

  useEffect(() => {
    const query = window.location.search;
    if (query) {
      const encodedContent = new URLSearchParams(query).get('content');
      setContent(decodeContent(encodedContent));
    }
  }, []);

  useEffect(() => {
    if (copied) {
      setTimeout(() => setCopied(false), 4000);
    }
  }, [copied]);

  return (
    <Tabs>
      <TabList>
        <Tab>Write</Tab>
        <Tab onClick={fetchLessonPreview}>Preview</Tab>
      </TabList>

      <TabPanel>
        <LessonContentInput onChange={setContent} content={content} />
      </TabPanel>
      <TabPanel>
        <LessonContentPreview content={convertedContent} />
      </TabPanel>
      <button
        type="button"
        className={`button ${copied ? 'button--secondary' : 'button--primary'} float-right mb-1`}
        onClick={handleClick}
      >
        {copied ? 'Copied!' : 'Share'}
      </button>
    </Tabs>
  );
};

export default LessonPreview;
