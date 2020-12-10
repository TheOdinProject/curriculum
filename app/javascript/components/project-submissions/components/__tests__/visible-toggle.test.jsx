import React from 'react';
import { render, fireEvent, screen } from '@testing-library/react';
import VisibleToggle from '../visible-toggle';

describe('VisibleToggle', () => {
  test('Indicates that a submission is public', () => {
    render(
      <VisibleToggle
        submission={{ is_public: true }}
        handleVisibleToggle={() => {}}
      />,
    );
    expect(screen.getByLabelText('Toggle visibility')).toHaveClass('submissions__public-icon--visible');
  });

  test('Indicates that a submission is private', () => {
    render(
      <VisibleToggle
        submission={{ is_public: false }}
        handleVisibleToggle={() => {}}
      />,
    );
    expect(screen.getByLabelText('Toggle visibility')).not.toHaveClass('submissions__public-icon--visible');
  });

  test('Toggles between public and private on click', () => {
    const submission = { is_public: true };
    const mockHandleVisibleToggle = jest.fn().mockImplementation(() => {
      submission.is_public = !submission.is_public;
    });

    const { rerender } = render(
      <VisibleToggle
        submission={submission}
        handleVisibleToggle={mockHandleVisibleToggle}
      />,
    );
    const component = screen.getByLabelText('Toggle visibility');

    fireEvent.click(component);
    expect(component).toHaveClass('submissions__public-icon--visible');

    rerender(
      <VisibleToggle
        submission={submission}
        handleVisibleToggle={mockHandleVisibleToggle}
      />,
    );
    expect(component).not.toHaveClass('submissions__public-icon--visible');
  });
});
