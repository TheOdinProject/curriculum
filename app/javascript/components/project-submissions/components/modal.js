import React from 'react';
import { func, bool, node } from 'prop-types';
import ScrollLock from 'react-scrolllock';


const Modal = ({ handleClose, show, children }) => {
  const showHideClassName = show ? 'react-modal' : 'react-modal--hidden';

  return (
    <ScrollLock isActive={show}>
      <div className={showHideClassName}>
        <div className='react-modal__body'>
          <div className="react-modal__close-btn" onClick={handleClose}></div>
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

export default Modal
