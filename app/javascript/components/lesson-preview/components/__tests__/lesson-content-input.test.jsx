import React from 'react';
import { render, fireEvent } from '@testing-library/react';
import LessonContentInput from '../lesson-content-input';

describe('Lesson Content Input', () => {
  const testContent = 'This is a test';
  let onChange;

  beforeEach(() => {
    onChange = jest.fn();
  });

  test('textarea has correct value if content provided', () => {
    const { getByPlaceholderText } = render(
      <LessonContentInput onChange={onChange} content={testContent} />
    );
    const textarea = getByPlaceholderText('Lesson content...');

    expect(textarea).toHaveValue('This is a test');
  });

  test('calls on change handler upon user input', () => {
    const { getByPlaceholderText } = render(
      <LessonContentInput onChange={onChange} content="" />
    );
    const textarea = getByPlaceholderText('Lesson content...');

    fireEvent.change(textarea, { target: { value: 'test' } });

    expect(onChange).toHaveBeenCalledWith('test');
  });
});

