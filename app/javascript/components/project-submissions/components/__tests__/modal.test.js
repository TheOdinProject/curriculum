import { fireEvent, render } from "@testing-library/react";
import React from "react";
import Modal from "../modal";

describe("Modal", () => {
  test("Checks for the specified classname on modal when the modal is not shown", () => {
    const { getByLabelText } = render(
      <Modal 
        handleClose={() => {}} 
        show={false}
      >
        {" "}
      </Modal>
    );

    expect(getByLabelText("modal--hidden")).toHaveClass("react-modal--hidden");
  });

  test("Checks for the specified classname on modal when the modal is shown", () => {
    const { getByLabelText } = render(
      <Modal 
        handleClose={() => {}} 
        show={true}
      >
        {" "}
      </Modal>
    );

    expect(getByLabelText("modal--shown")).toHaveClass("react-modal");
  });

  test("Calls close handler when clicked", () => {
    const handleClick = jest.fn();

    const { getByLabelText } = render(
      <Modal 
        handleClose={handleClick} 
        show={true}
      >
        {" "}
      </Modal>
    );

    fireEvent.click(getByLabelText(/close/));

    expect(handleClick).toHaveBeenCalledTimes(1);
  });
});
