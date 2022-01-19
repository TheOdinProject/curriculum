import React from 'react';
import {
  fireEvent, render, screen, act,
} from '@testing-library/react';
import CreateForm from '../create-form';
import ProjectSubmissionContext from '../../ProjectSubmissionContext';

const onSubmit = jest.fn();
const onClose = jest.fn();
const userId = 1;

describe('CreateForm', () => {
  describe('When submission is created successfully', () => {
    beforeEach(async () => {
      render(
        <ProjectSubmissionContext.Provider value={{ lesson: { has_live_preview: true } }}>
          <CreateForm
            onSubmit={onSubmit}
            userId={userId}
            onClose={onClose}
          />
          ,
        </ProjectSubmissionContext.Provider>,
      );

      await act(async () => {
        const repoUrlInput = screen.getByTestId('repo-url-field');
        const livePreviewUrlInput = screen.getByTestId('live-preview-url-field');
        const isPublicToggle = screen.getByTestId('is-public-toggle-slider');

        fireEvent.change(repoUrlInput, { target: { value: 'https://github.com/repo-url' } });
        fireEvent.change(livePreviewUrlInput, { target: { value: 'https://live-preview.com' } });
        fireEvent.change(isPublicToggle, { target: { checked: false } });
        fireEvent.click(screen.getByTestId('submit-btn'));
      });
    });

    test('calls onSubmit', () => {
      expect(onSubmit).toHaveBeenCalledTimes(1);
    });

    test('displays the success screen', () => {
      expect(screen.getByTestId('success-message').textContent).toEqual('Thanks for Submitting Your Solution!');
    });

    test('displays the close button', async () => {
      await act(async () => {
        fireEvent.click(screen.getByTestId('close-btn'));
      });

      expect(onClose).toHaveBeenCalledTimes(1);
    });
  });

  describe('when url fields are not present', () => {
    beforeEach(() => {
      render(
        <ProjectSubmissionContext.Provider value={{ lesson: { has_live_preview: true } }}>
          <CreateForm
            onSubmit={onSubmit}
            userId={userId}
            onClose={onClose}
          />
          ,
        </ProjectSubmissionContext.Provider>,
      );
    });

    it('validates repo_url', async () => {
      await act(async () => {
        const repoUrlInput = screen.getByTestId('repo-url-field');

        fireEvent.change(repoUrlInput, { target: { value: '' } });
        fireEvent.click(screen.getByTestId('submit-btn'));
      });

      expect(screen.getByText('Required')).toBeInTheDocument();
      expect(onSubmit).toHaveBeenCalledTimes(0);
    });

    test('validates live_preview_url', async () => {
      await act(async () => {
        const livePreviewUrlInput = screen.getByTestId('live-preview-url-field');

        fireEvent.change(livePreviewUrlInput, { target: { value: '' } });
        fireEvent.click(screen.getByTestId('submit-btn'));
      });

      expect(screen.getByText('Required')).toBeInTheDocument();
      expect(onSubmit).toHaveBeenCalledTimes(0);
    });
  });

  describe('when url fields are not valid', () => {
    beforeEach(() => {
      render(
        <ProjectSubmissionContext.Provider value={{ lesson: { has_live_preview: true } }}>
          <CreateForm
            onSubmit={onSubmit}
            userId={userId}
            onClose={onClose}
          />
          ,
        </ProjectSubmissionContext.Provider>,
      );
    });

    it('validates repo_url', async () => {
      await act(async () => {
        const repoUrlInput = screen.getByTestId('repo-url-field');

        fireEvent.change(repoUrlInput, { target: { value: 'not-a-url' } });
        fireEvent.click(screen.getByTestId('submit-btn'));
      });

      expect(screen.getByText('Url must start with http or https')).toBeInTheDocument();
      expect(onSubmit).toHaveBeenCalledTimes(0);
    });

    test('validates live_preview_url', async () => {
      await act(async () => {
        const livePreviewUrlInput = screen.getByTestId('live-preview-url-field');

        fireEvent.change(livePreviewUrlInput, { target: { value: 'not a url' } });
        fireEvent.click(screen.getByTestId('submit-btn'));
      });

      expect(screen.getByText('Url must start with http or https')).toBeInTheDocument();
      expect(onSubmit).toHaveBeenCalledTimes(0);
    });
  });

  describe('When submission does not have a live preview', () => {
    beforeEach(() => {
      render(
        <ProjectSubmissionContext.Provider value={{ lesson: { has_live_preview: false } }}>
          <CreateForm
            onSubmit={onSubmit}
            userId={userId}
            onClose={onClose}
          />
          ,
        </ProjectSubmissionContext.Provider>,
      );
    });

    test('does not display a live preview url input', () => {
      expect(screen.queryByTestId('live-preview-url')).not.toBeInTheDocument();
    });
  });
});
