import React from 'react';
import {
  fireEvent, render, screen, act,
} from '@testing-library/react';
import FlagForm from '../flag-form';

describe('FlagForm', () => {
  let onSubmit;

  beforeEach(() => {
    onSubmit = jest.fn();
  });

  describe('when the reason is empty', () => {
    beforeEach(async () => {
      render(
        <FlagForm
          userId={43}
          onSubmit={onSubmit}
          submission={{ id: 47 }}
        />,
      );

      await act(async () => {
        fireEvent.click(screen.getByRole('button', { name: /flag/i }));
      });
    });

    test('indicates that a field is required', () => {
      expect(screen.getByText(/required/i)).toBeInTheDocument();
    });

    test('does not call onSubmit', () => {
      expect(onSubmit).not.toHaveBeenCalled();
    });
  });

  describe('when the reason is too short', () => {
    beforeEach(async () => {
      render(
        <FlagForm
          userId={43}
          onSubmit={onSubmit}
          submission={{ id: 47 }}
        />,
      );

      await act(async () => {
        fireEvent.change(screen.getByRole('textbox'), {
          target: { value: 'idk' },
        });

        fireEvent.click(screen.getByRole('button', { name: /flag/i }));
      });
    });

    test('displays an error message', () => {
      expect(screen.getByText(/Must be at least \d+ characters/)).toBeInTheDocument();
    });

    test('does not call onSubmit', () => {
      expect(onSubmit).not.toHaveBeenCalled();
    });
  });

  describe('when the reason is successfully submitted', () => {
    beforeEach(async () => {
      render(
        <FlagForm
          userId={43}
          onSubmit={onSubmit}
          submission={{ id: 47 }}
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

    test('calls onSubmit', () => {
      expect(onSubmit).toHaveBeenCalledTimes(1);
    });
  });
});
