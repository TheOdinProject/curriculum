import React from 'react';
import { render, fireEvent, screen } from '@testing-library/react';
import VisibleToggle from '../visible-toggle';

describe('VisibleToggle', () => {
  test('Toggles from public to private on click', () => {
    const publicSubmission = {
      id: '1',
      is_public: true,
      live_preview_url: 'https://www.google.com',
      repo_url: 'https://www.google.com',
    }

    render(
      <VisibleToggle
        submission={publicSubmission}
        handleVisibleToggle={() => {}}
      />
    )

    fireEvent.click(screen.getByLabelText('Toggle visibility'));

    expect(screen.getByLabelText('Toggle visibility')).toHaveClass('submissions__public-icon--visible');
  });

  test('Toggles from public to private on click', () => {
    const privateSubmission = {
      id: '1',
      is_public: false,
      live_preview_url: 'https://www.google.com',
      repo_url: 'https://www.google.com',
    }

    render(
      <VisibleToggle
        submission={privateSubmission}
        handleVisibleToggle={() => {}}
      />
    )

    fireEvent.click(screen.getByLabelText('Toggle visibility'));

    expect(screen.getByLabelText('Toggle visibility')).not.toHaveClass('submissions__public-icon--visible');
  });
});
