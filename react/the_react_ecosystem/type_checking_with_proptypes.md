Type Checking is a process of verifying that a piece of code is using the correct data types for variables, function parameters and return values. In the context of React applications, we are going to use PropTypes to do that job.

PropTypes is a way to type check the props that a React component receives. It helps to catch potential type errors during development, making it easier to spot and fix bugs. If you have used a linter in your previous React projects, there's a good chance it ended up yelling at you about certain props missing in prop validation, however if that isn't the case- well, lucky you!

    @@ -15,44 +15,61 @@ This section contains a general overview of topics that you will learn in this l

To start using PropTypes in our React projects, we first need to install the corresponding library. We can do that with npm. In your React project run the following command:

~~~
npm install --save prop-types
~~~

Next, we want to import the PropTypes package in the component whose props we want to validate.

~~~javascript
import PropTypes from "prop-types";
~~~

### Using propTypes

Here is a very basic example of how we would use it in a simple component that renders out a name prop.

~~~javascript
import PropTypes from "prop-types";
import React from "react";

const RenderName = (props) => {
  return <div>{props.name}</div>;
};

RenderName.propTypes = {
  name: PropTypes.string.isRequired, //isRequired flag set to true for `name` prop
};

export default RenderName;
~~~

In this example, the component RenderName must receive a prop called `name` since the `isRequired` flag is set to true. It also must be a string. If the the `name` prop is not passed, or if it is not a string, a warning will be displayed.

~~~javascript
import PropTypes from "prop-types";
import React from "react";

const RenderName = (props) => {
  return <div>{props.name}</div>;
};

RenderName.propTypes = {
  name: PropTypes.string, //isRequired flag set to false for `name` prop
};

export default RenderName;
~~~

Here, if no `name` prop is passed, no error will be displayed because the `isRequired` flag is set to false. Still however, if anything other than type string is passed, a warning will be displayed.

### Using defaultProps

Another cool thing we can do with PropTypes is passing in default props:

~~~javascript
import React from "react";
import PropTypes from "prop-types";

const RenderName = (props) => {
  return <div>{props.name}</div>;
};
~~~

RenderName.propTypes = {
};

RenderName.defaultProps = {
name: "Zach",
};

export default RenderName;

In this example, with the help of the defaultProps property we are defining a default value for the `name` prop. This way, if the `RenderName` component is called without passing in the `name` prop, it will default to "Zach". When you do pass in props, they will take precedence over the default props.
