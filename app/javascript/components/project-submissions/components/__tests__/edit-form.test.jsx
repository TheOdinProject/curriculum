import React from 'react';
import {
  fireEvent, render, screen, act,
} from '@testing-library/react';
import EditForm from '../edit-form';

const submission = {
  repo_url: 'http://example.com/repo',
  live_preview_url: 'http://example.com/live',
  is_public: true,
  lesson_has_live_preview: true,
};

const handleUpdate = jest.fn();
const handleDelete = jest.fn();
const toggleShowEditModal = jest.fn();

describe('EditForm', () => {
  beforeEach(() => {
    render(
      <EditForm
        submission={submission}
        onSubmit={handleUpdate}
        onDelete={handleDelete}
        onClose={toggleShowEditModal}
      />,
    );
  });

  describe("Displays submission URL's", () => {
    test('displays repo_url', () => {
      expect(screen.getByDisplayValue('http://example.com/repo')).toBeInTheDocument();
    });
    test('displays live_preview_url', () => {
      expect(screen.getByDisplayValue('http://example.com/live')).toBeInTheDocument();
    });
  });

  describe("Validates submission URL's", () => {
    test('validates repo_url', async () => {
      await act(async () => {
        fireEvent.change(screen.getByPlaceholderText(/repository url/i), {
          target: { value: 'idk' },
        });

        fireEvent.click(screen.getByRole('button', { name: 'Update' }));
      });
      expect(screen.getByText(/url must start with http or https/i)).toBeInTheDocument();
      expect(handleUpdate).toHaveBeenCalledTimes(0);
    });

    test('validates live_preview_url', async () => {
      await act(async () => {
        fireEvent.change(screen.getByPlaceholderText(/live preview url/i), {
          target: { value: 'idk' },
        });

        fireEvent.click(screen.getByRole('button', { name: 'Update' }));
      });
      expect(screen.getByText(/url must start with http or https/i)).toBeInTheDocument();
      expect(handleUpdate).toHaveBeenCalledTimes(0);
    });
  });
  describe('When submission updated', () => {
    beforeEach(async () => {
      await act(async () => {
        fireEvent.click(screen.getByRole('button', {
          name: /update/i,
        }));
      });
    });

    test('calls onSubmit', () => {
      expect(handleUpdate).toHaveBeenCalledTimes(1);
    });

    test('shows thanks message', () => {
      expect(screen.getByRole('heading', {
        name: /thanks for updating your solution!/i,
      })).toBeInTheDocument();
    });
    test('shows close button', () => {
      expect(screen.getByRole('button', { name: 'Close' })).toBeInTheDocument();
    });
  });

  describe('When submission deleted', () => {
    beforeEach(async () => {
      await act(async () => {
        fireEvent.click(screen.getByRole('button', {
          name: /delete/i,
        }));
      });
    });
    test('calls onDelete', () => {
      expect(handleDelete).toHaveBeenCalledTimes(1);
      expect(toggleShowEditModal).toHaveBeenCalledTimes(1);
    });
    test('shows thanks message', () => {
      expect(screen.getByRole('heading', {
        name: /thanks for updating your solution!/i,
      })).toBeInTheDocument();
    });
    test('shows close button', () => {
      expect(screen.getByRole('button', { name: 'Close' })).toBeInTheDocument();
    });
  });
});
