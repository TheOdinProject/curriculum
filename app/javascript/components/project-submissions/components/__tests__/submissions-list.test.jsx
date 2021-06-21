/* eslint-disable react/prop-types */
import React from 'react';
import { render, screen } from '@testing-library/react';

import ProjectSubmissionContext from '../../ProjectSubmissionContext';
import SubmissionsList from '../submissions-list';

jest.mock('react-flip-move', () => ({ children }) => <div>{children}</div>);

jest.mock('../submission', () => ({ submission, isDashboardView }) => (
  <>
    <div data-test-id="submission">{submission.id}</div>
    <div data-test-id="dashboard">{isDashboardView.toString()}</div>
  </>
));

// setup props
const submissions = [
  { id: 'foo', likes: 3 },
  { id: 'bar', likes: 2 },
  { id: 'baz', likes: 1 },
];
const userSubmission = { id: 'foobar' };
const handleDelete = jest.fn();
const onFlag = jest.fn();
const handleUpdate = jest.fn();
const handleLikeToggle = jest.fn();

describe('submissions list', () => {
  describe('submissions', () => {
    it('renders the submissions array in order of likes', () => {
      render(
        <ProjectSubmissionContext.Provider value={{ allSubmissionsPath: '#' }}>
          <SubmissionsList
            submissions={submissions}
            handleDelete={handleDelete}
            handleUpdate={handleUpdate}
            handleLikeToggle={handleLikeToggle}
          />
        </ProjectSubmissionContext.Provider>,
      );

      expect(screen.queryAllByTestId('submission').length).toBe(3);
      expect(screen.queryAllByTestId('submission')[0].textContent).toBe('foo');
      expect(screen.queryAllByTestId('submission')[1].textContent).toBe('bar');
      expect(screen.queryAllByTestId('submission')[2].textContent).toBe('baz');
    });

    it('does not render any submissions when array is empty, an instead renders a no submissions message', () => {
      render(
        <ProjectSubmissionContext.Provider value={{ allSubmissionsPath: '#' }}>
          <SubmissionsList
            submissions={[]}
            handleDelete={handleDelete}
            handleUpdate={handleUpdate}
            handleLikeToggle={handleLikeToggle}
          />
        </ProjectSubmissionContext.Provider>,
      );

      expect(screen.queryAllByTestId('submission').length).toBe(0);
      expect(
        screen.getByText('No Submissions yet, be the first!'),
      ).toBeInTheDocument();
    });
  });

  describe('user submission', () => {
    it('renders a user submission when provided', () => {
      render(
        <ProjectSubmissionContext.Provider value={{ allSubmissionsPath: '#' }}>
          <SubmissionsList
            submissions={submissions}
            userSubmission={userSubmission}
            handleDelete={handleDelete}
            handleUpdate={handleUpdate}
            handleLikeToggle={handleLikeToggle}
          />
        </ProjectSubmissionContext.Provider>,
      );

      expect(screen.queryAllByTestId('submission').length).toBe(4);
      expect(screen.getByText('foobar')).toBeInTheDocument();
    });

    it('does not render a user submission when not provided', () => {
      render(
        <ProjectSubmissionContext.Provider value={{ allSubmissionsPath: '#' }}>
          <SubmissionsList
            submissions={submissions}
            handleDelete={handleDelete}
            handleUpdate={handleUpdate}
            handleLikeToggle={handleLikeToggle}
          />
        </ProjectSubmissionContext.Provider>,
      );

      expect(screen.queryAllByTestId('submission').length).toBe(3);
      expect(screen.queryByText('foobar')).not.toBeInTheDocument();
    });
  });

  describe('context', () => {
    it('renders view more section if allSubmissionsPath is provided in context', () => {
      render(
        <ProjectSubmissionContext.Provider value={{ allSubmissionsPath: '#' }}>
          <SubmissionsList
            submissions={submissions}
            handleDelete={handleDelete}
            handleUpdate={handleUpdate}
            handleLikeToggle={handleLikeToggle}
            onFlag={onFlag}
          />
        </ProjectSubmissionContext.Provider>,
      );

      expect(screen.getByTestId('view-all-projects-link')).toBeInTheDocument();
    });

    it('does not render view more section if allSubmissionsPath is not provided in context', () => {
      render(
        <ProjectSubmissionContext.Provider value={{ allSubmissionsPath: '' }}>
          <SubmissionsList
            submissions={submissions}
            handleDelete={handleDelete}
            handleUpdate={handleUpdate}
            handleLikeToggle={handleLikeToggle}
            onFlag={onFlag}
          />
        </ProjectSubmissionContext.Provider>,
      );

      expect(
        screen.queryByTestId('view-all-projects-link'),
      ).not.toBeInTheDocument();
    });
  });
});
