import React from 'react';
import { render } from '@testing-library/react';
import FlagForm from '../flag-form';

describe('FlagForm', () => {
  describe('when the user is not signed in', () => {
    test('prompts the user to sign in', () => {
      const { getByRole } = render((
        <FlagForm
          userId={null}
          onSubmit={() => {}}
          submission={{}}
        />
      ));

      expect(getByRole('link', { name: /sign in/i })).toBeInTheDocument();
    });
  });
});
