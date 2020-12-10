import React from 'react';
import { render, screen } from '@testing-library/react';
import '@testing-library/jest-dom';
import SubmissionTitle from '../submission-title';

const submission = {
  lesson_path: 'test_path',
  lesson_title: 'Test Title',
  user_name: 'TestUser',
};

describe('Submission title', () => {
  it('displays the lesson title in dashboard view', () => {
    render(
      <SubmissionTitle
        submission={submission}
        isDashboardView
      />,
    );
    expect(screen.getByText('Test Title')).toBeInTheDocument();
  });
  it('displays a link to the project in dashboard view', () => {
    render(
      <SubmissionTitle
        submission={submission}
        isDashboardView
      />,
    );
    expect(screen.getByText('Test Title')).toHaveAttribute('href', 'test_path');
  });
  it('displays username if not in dashboard mode', () => {
    render(<SubmissionTitle submission={submission} />);
    expect(screen.getByText('TestUser')).toBeInTheDocument();
  });
});
