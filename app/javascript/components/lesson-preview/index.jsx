import React, { useState, useEffect } from 'react';
import {
  Tab, Tabs, TabList, TabPanel,
} from 'react-tabs';
import Prism from 'prismjs';

import LessonContentInput from './components/lesson-content-input';
import LessonContentPreview from './components/lesson-content-preview';
import axios from '../../src/js/axiosWithCsrf';

import 'react-tabs/style/react-tabs.css';

const LessonPreview = () => {
  const [content, setContent] = useState('');
  const [convertedContent, setConvertedContent] = useState('');

  const fetchLessonPreview = async () => {
    const response = await axios.post('/lessons/preview', { content });

    if (response.status === 200) {
      setConvertedContent(response.data.content);
    }
  };

  useEffect(() => {
    Prism.highlightAll();
  }, [convertedContent]);

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
    </Tabs>
  );
};

export default LessonPreview;
