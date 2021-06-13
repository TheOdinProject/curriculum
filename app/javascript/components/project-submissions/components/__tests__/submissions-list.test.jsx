/* eslint-disable react/prop-types */
import React from 'react';
import { render, screen, fireEvent } from '@testing-library/react';

import ProjectSubmissionContext from '../../ProjectSubmissionContext';
import SubmissionsList from '../submissions-list';

jest.mock('react-flip-move', () => ({ children }) => <div>{children}</div>);

jest.mock(
  '../submission',
  () => ({
    submission,
    isDashboardView,
    handleDelete,
    onFlag,
    handleUpdate,
    handleLikeToggle,
  }) => (
    <>
      <div data-test-id="submission">{submission.id}</div>
      <div data-test-id="dashboard">{isDashboardView.toString()}</div>
      <button type="button" data-test-id="delete" onClick={handleDelete}>
        DELETE
      </button>
      <button type="button" data-test-id="flag" onClick={onFlag}>
        FLAG
      </button>
      <button type="button" data-test-id="update" onClick={handleUpdate}>
        UPDATE
      </button>
      <button type="button" data-test-id="like" onClick={handleLikeToggle}>
        LIKE
      </button>
    </>
  ),
);

// setup props
const submissions = [{ id: 'foo' }, { id: 'bar' }, { id: 'baz' }];
const userSubmission = { id: 'foobar' };
const handleDelete = jest.fn();
const onFlag = jest.fn();
const handleUpdate = jest.fn();
const handleLikeToggle = jest.fn();

describe('submissions list', () => {
  describe('submissions', () => {
    it('renders the submissions array', () => {
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
      expect(screen.getByText('foo')).toBeInTheDocument();
      expect(screen.getByText('bar')).toBeInTheDocument();
      expect(screen.getByText('baz')).toBeInTheDocument();
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

  describe('isDashboardView', () => {
    it('passes default isDashboardView prop to submissions list', () => {
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

      expect(
        screen
          .getAllByTestId('dashboard')
          .every((node) => node.textContent === 'false'),
      ).toBe(true);
    });

    it('passes non-default isDashboardView prop to submissions list', () => {
      render(
        <ProjectSubmissionContext.Provider value={{ allSubmissionsPath: '#' }}>
          <SubmissionsList
            submissions={submissions}
            handleDelete={handleDelete}
            handleUpdate={handleUpdate}
            handleLikeToggle={handleLikeToggle}
            isDashboardView
          />
        </ProjectSubmissionContext.Provider>,
      );

      expect(
        screen
          .getAllByTestId('dashboard')
          .every((node) => node.textContent === 'true'),
      ).toBe(true);
    });

    it('passes isDashboardView prop to the user submission', () => {
      render(
        <ProjectSubmissionContext.Provider value={{ allSubmissionsPath: '#' }}>
          <SubmissionsList
            submissions={[]}
            handleDelete={handleDelete}
            handleUpdate={handleUpdate}
            handleLikeToggle={handleLikeToggle}
            userSubmission={userSubmission}
            isDashboardView
          />
        </ProjectSubmissionContext.Provider>,
      );

      expect(screen.getByTestId('dashboard').textContent).toBe('true');
    });
  });

  describe('handleDelete', () => {
    it('passes handleDelete prop to submissions array', () => {
      render(
        <ProjectSubmissionContext.Provider value={{ allSubmissionsPath: '#' }}>
          <SubmissionsList
            submissions={[{ id: 'foo' }]}
            handleDelete={handleDelete}
            handleUpdate={handleUpdate}
            handleLikeToggle={handleLikeToggle}
            onFlag={onFlag}
          />
        </ProjectSubmissionContext.Provider>,
      );

      fireEvent.click(screen.getByText('DELETE'));

      expect(handleDelete).toHaveBeenCalledTimes(1);
    });

    it('passes handleDelete prop to user submission', () => {
      render(
        <ProjectSubmissionContext.Provider value={{ allSubmissionsPath: '#' }}>
          <SubmissionsList
            submissions={[]}
            userSubmission={userSubmission}
            handleDelete={handleDelete}
            handleUpdate={handleUpdate}
            handleLikeToggle={handleLikeToggle}
            onFlag={onFlag}
          />
        </ProjectSubmissionContext.Provider>,
      );

      fireEvent.click(screen.getByText('DELETE'));

      expect(handleDelete).toHaveBeenCalledTimes(1);
    });
  });

  describe('onFlag', () => {
    it('passes onFlag prop to submissions array', () => {
      render(
        <ProjectSubmissionContext.Provider value={{ allSubmissionsPath: '#' }}>
          <SubmissionsList
            submissions={[{ id: 'foo' }]}
            handleDelete={handleDelete}
            handleUpdate={handleUpdate}
            handleLikeToggle={handleLikeToggle}
            onFlag={onFlag}
          />
        </ProjectSubmissionContext.Provider>,
      );

      fireEvent.click(screen.getByText('FLAG'));

      expect(onFlag).toHaveBeenCalledTimes(1);
    });

    it('passes onFlag prop to user submission', () => {
      render(
        <ProjectSubmissionContext.Provider value={{ allSubmissionsPath: '#' }}>
          <SubmissionsList
            submissions={[]}
            userSubmission={userSubmission}
            handleDelete={handleDelete}
            handleUpdate={handleUpdate}
            handleLikeToggle={handleLikeToggle}
            onFlag={onFlag}
          />
        </ProjectSubmissionContext.Provider>,
      );

      fireEvent.click(screen.getByText('FLAG'));

      expect(onFlag).toHaveBeenCalledTimes(1);
    });
  });

  describe('handleUpdate', () => {
    it('passes handleUpdate prop to submissions array', () => {
      render(
        <ProjectSubmissionContext.Provider value={{ allSubmissionsPath: '#' }}>
          <SubmissionsList
            submissions={[{ id: 'foo' }]}
            handleDelete={handleDelete}
            handleUpdate={handleUpdate}
            handleLikeToggle={handleLikeToggle}
            onFlag={onFlag}
          />
        </ProjectSubmissionContext.Provider>,
      );

      fireEvent.click(screen.getByText('UPDATE'));

      expect(handleUpdate).toHaveBeenCalledTimes(1);
    });

    it('passes handleUpdate prop to user submission', () => {
      render(
        <ProjectSubmissionContext.Provider value={{ allSubmissionsPath: '#' }}>
          <SubmissionsList
            submissions={[]}
            userSubmission={userSubmission}
            handleDelete={handleDelete}
            handleUpdate={handleUpdate}
            handleLikeToggle={handleLikeToggle}
            onFlag={onFlag}
          />
        </ProjectSubmissionContext.Provider>,
      );

      fireEvent.click(screen.getByText('UPDATE'));

      expect(handleUpdate).toHaveBeenCalledTimes(1);
    });
  });

  describe('handleLikeToggle', () => {
    it('passes handleLikeToggle prop to submissions array', () => {
      render(
        <ProjectSubmissionContext.Provider value={{ allSubmissionsPath: '#' }}>
          <SubmissionsList
            submissions={[{ id: 'foo' }]}
            handleDelete={handleDelete}
            handleUpdate={handleUpdate}
            handleLikeToggle={handleLikeToggle}
            onFlag={onFlag}
          />
        </ProjectSubmissionContext.Provider>,
      );

      fireEvent.click(screen.getByText('LIKE'));

      expect(handleLikeToggle).toHaveBeenCalledTimes(1);
    });

    it('passes handleLikeToggle prop to user submission', () => {
      render(
        <ProjectSubmissionContext.Provider value={{ allSubmissionsPath: '#' }}>
          <SubmissionsList
            submissions={[]}
            userSubmission={userSubmission}
            handleDelete={handleDelete}
            handleUpdate={handleUpdate}
            handleLikeToggle={handleLikeToggle}
            onFlag={onFlag}
          />
        </ProjectSubmissionContext.Provider>,
      );

      fireEvent.click(screen.getByText('LIKE'));

      expect(handleLikeToggle).toHaveBeenCalledTimes(1);
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
