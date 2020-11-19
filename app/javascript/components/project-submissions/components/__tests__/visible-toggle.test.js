import React from 'react';
import { render, fireEvent, screen } from '@testing-library/react';
import VisibleToggle from '../visible-toggle';

describe('VisibleToggle', () => {
  test('Indicates that a submission is public', () => {
    render(
      <VisibleToggle
        submission={{ is_public: true }}
        handleVisibleToggle={() => {}}
      />
    );

    expect(screen.getByLabelText('Toggle visibility')).toHaveClass('submissions__public-icon--visible');
  });

  test('Indicates that a submission is private', () => {
    render(
      <VisibleToggle
        submission={{ is_public: false }}
        handleVisibleToggle={() => {}}
      />
    )

    expect(screen.getByLabelText('Toggle visibility')).not.toHaveClass('submissions__public-icon--visible');
  });
});
