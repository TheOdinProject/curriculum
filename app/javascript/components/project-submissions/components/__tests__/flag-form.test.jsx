import React from 'react';
import {
  fireEvent, render, screen, act,
} from '@testing-library/react';
import FlagForm from '../flag-form';

describe('FlagForm', () => {
  describe('when the user is not signed in', () => {
    test('prompts the user to sign in', () => {
      render((
        <FlagForm
          userId={null}
          onSubmit={() => {}}
          submission={{}}
        />
      ));

      expect(screen.getByRole('link', { name: /sign in/i })).toBeInTheDocument();
    });
  });

  describe('when submission is successful', () => {
    beforeEach(async () => {
      render(
        <FlagForm
          userId={43}
          onSubmit={() => {}}
          submission={{}}
        />,
      );

      await act(async () => {
        fireEvent.change(screen.getByRole('textbox'), {
          target: { value: 'Submission has malicious content' },
        });

        fireEvent.click(screen.getByRole('button', { name: /flag/i }));
      });
    });

    test('shows a thank you message', () => {
      expect(screen.getByRole('heading', { name: /thank/i })).toBeInTheDocument();
    });

    test('shows intent to review', () => {
      expect(screen.getByText(/review/i)).toBeInTheDocument();
    });
  });
});
