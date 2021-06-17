/* eslint-disable react/prop-types */
import React, { useState } from 'react';
import {
  fireEvent, render, screen, act,
} from '@testing-library/react';

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

    it('reorders submissions when a submission gains more likes than the one above it', () => {
      // this test component is used to mock the user interaction of increasing the likes
      // on a particular submission
      const TestComponent = () => {
        // setup dummy submissions to be able to change submission like numbers with an event
        const [testSubmissions, setTestSubmissions] = useState(submissions);

        // set 'baz' likes to 10, putting it first in the order instead of third
        const reorderSubmissions = () => {
          const newSubmissions = [...submissions];
          const baz = newSubmissions.findIndex((sub) => sub.id === 'baz');
          newSubmissions[baz] = { ...newSubmissions[baz], likes: 10 };

          setTestSubmissions(newSubmissions);
        };

        return (
          <>
            <SubmissionsList
              submissions={testSubmissions}
              handleDelete={handleDelete}
              handleUpdate={handleUpdate}
              handleLikeToggle={handleLikeToggle}
            />
            <button
              type="button"
              onClick={reorderSubmissions}
              data-test-id="reorder"
            >
              Click me
            </button>
          </>
        );
      };

      render(
        <ProjectSubmissionContext.Provider value={{ allSubmissionsPath: '#' }}>
          <TestComponent />
        </ProjectSubmissionContext.Provider>,
      );

      expect(screen.queryAllByTestId('submission')[0].textContent).toBe('foo');
      expect(screen.queryAllByTestId('submission')[2].textContent).toBe('baz');

      act(() => fireEvent.click(screen.getByTestId('reorder')));

      expect(screen.queryAllByTestId('submission')[0].textContent).toBe('baz');
      expect(screen.queryAllByTestId('submission')[1].textContent).toBe('foo');
    });

    it('does not render any submissions when array is empty', () => {
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
    });

    it('renders a no submissions yet message when array is empty', () => {
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
