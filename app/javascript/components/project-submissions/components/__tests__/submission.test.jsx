import React from 'react';
import { render, fireEvent } from '@testing-library/react';

import ProjectSubmissionContext from '../../ProjectSubmissionContext';
import Submission from '../submission';

const defaultSubmission = {
  user_name: 'Example User',
  repo_url: 'http://example.com/repo',
  live_preview_url: 'https://google.com',
  is_public: true,
  lesson_has_live_preview: true,
  user_id: 1,
};

const renderSubmissionComponent = (submission, userId = 1, onFlag) => render(
  <ProjectSubmissionContext.Provider value={{
    userId,
  }}
  >
    <Submission
      submission={submission}
      handleUpdate={jest.fn()}
      onFlag={onFlag || jest.fn()}
      handleDelete={jest.fn()}
      handleLikeToggle={jest.fn()}
    />
    ,
  </ProjectSubmissionContext.Provider>,
);

describe('Submission', () => {
  let queryByTestId;

  describe('Tests for all submissions', () => {
    test('Renders live preview with valid live_preview_url', () => {
      ({ queryByTestId } = renderSubmissionComponent({
        ...defaultSubmission,
        live_preview_url: 'https://google.com',
      }));

      const livePreviewLink = queryByTestId('live-preview-btn');
      expect(livePreviewLink).toBeInTheDocument();
      expect(livePreviewLink).toHaveAttribute('target', '_blank');
    });

    test('Does not render live preivew without live_preview_url', () => {
      ({ queryByTestId } = renderSubmissionComponent({
        ...defaultSubmission,
        live_preview_url: '',
      }));

      const livePreviewLink = queryByTestId('live-preview-btn');
      expect(livePreviewLink).not.toBeInTheDocument();
    });

    test('Renders view code link', () => {
      ({ queryByTestId } = renderSubmissionComponent(defaultSubmission));

      const viewCodeLink = queryByTestId('view-code-btn');
      expect(viewCodeLink).toBeInTheDocument();
      expect(viewCodeLink).toHaveAttribute('target', '_blank');
    });
  });

  describe('Given the current user owns the submission', () => {
    beforeEach(() => {
      ({ queryByTestId } = renderSubmissionComponent(defaultSubmission));
    });

    test('Renders edit button', () => {
      const editButton = queryByTestId('edit-submission-btn');
      expect(editButton).toBeInTheDocument();
    });

    test('Displays edit modal when edit button is clicked.', () => {
      fireEvent.mouseDown(queryByTestId('edit-submission-btn'));

      const editForm = queryByTestId('edit-form');
      expect(editForm).toBeInTheDocument();
    });

    test("Doesn't render report button", () => {
      const reportButton = queryByTestId('flag-btn');
      expect(reportButton).not.toBeInTheDocument();
    });
  });

  describe('Given the current user does not own the submission', () => {
    const onFlag = jest.fn();

    beforeEach(() => {
      ({ queryByTestId } = renderSubmissionComponent(defaultSubmission, 2, onFlag));
    });

    test('Does not render edit button', () => {
      const editButton = queryByTestId('edit-submission-btn');
      expect(editButton).not.toBeInTheDocument();
    });

    test('Renders report button', () => {
      const reportButton = queryByTestId('flag-btn');
      expect(reportButton).toBeInTheDocument();
    });

    test('Report button fires onFlag handler', () => {
      fireEvent.click(queryByTestId('flag-btn'));

      expect(onFlag).toHaveBeenCalledTimes(1);
    });
  });
});
