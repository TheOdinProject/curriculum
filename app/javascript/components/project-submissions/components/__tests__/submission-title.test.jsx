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
  describe('when on the dashboard view', () => {
    it('displays the lesson title', () => {
      render(<SubmissionTitle submission={submission} isDashboardView />);
      expect(screen.getByText('Test Title')).toBeInTheDocument();
    });

    it('displays a link to the project', () => {
      render(<SubmissionTitle submission={submission} isDashboardView />);
      expect(screen.getByText('Test Title')).toHaveAttribute('href', 'test_path');
    });
  });

  describe('when not on the dashboard view', () => {
    it('displays submissions username', () => {
      render(<SubmissionTitle submission={submission} />);
      expect(screen.getByText('TestUser')).toBeInTheDocument();
      expect(screen.getByText('TestUser')).not.toHaveAttribute('href', '/');
    });

    it('displays link to users dashboard when submission belongs to the current user', () => {
      render(<SubmissionTitle submission={submission} isCurrentUsersSubmission />);
      expect(screen.getByText('TestUser')).toHaveAttribute('href', '/');
    });
  });
});
