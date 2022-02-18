import React from 'react';
import { func, bool, node } from 'prop-types';
import ScrollLock from 'react-scrolllock';

const modalShown = 'fixed inset-0 bg-black bg-opacity-60 z-50 react-modal';
const modalBodyPosition = 'fixed top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2';
const modalCloseBtn = `
  absolute inline
  top-4 right-4 m-0 p-0 border-0
  bg-transparent
  text-odin-green hover:text-black text-xl font-black
  cursor-pointer
`;

const Modal = ({ handleClose, show, children }) => {
  const showHideClassName = show ? modalShown : 'hidden';

  return (
    <ScrollLock isActive={show}>
      <div className={showHideClassName} aria-label={show ? 'modal--shown' : 'modal--hidden'}>
        <div className={`${modalBodyPosition} h-auto p-10 rounded-xl bg-white w-11/12 sm:w-4/5 md:w-3/5 lg:w-2/5`}>
          <button
            className={modalCloseBtn}
            onClick={handleClose}
            type="button"
            aria-label="close"
          >
            <i className="fas fa-times" />
          </button>
          {show && children}
        </div>
      </div>
    </ScrollLock>
  );
};

Modal.propTypes = {
  handleClose: func.isRequired,
  show: bool.isRequired,
  children: node.isRequired,
};

export default Modal;
