# React JS

## Introduction
React was created by facebook in 2013 to help with creating user interfaces. It quickly became a popular framework and many companies use it for their own web development needs. It is often used to create single page applications.

## Overview

React is used most in conjuction with the react router to create single page web-application that feel like multi-page websites. This can make websites feel very fast when a user does not have to wait for different pages to load. It can also reduce strain on the server by having the client render the web page they request for you. 

This framework's most defining feature is it's components. React was developed to be modular, and have easy to use 'parts' that can be plugged into different parts of your application. React heavily uses a syntax called JSX, which is an html like syntax for javascript. (This can be used without react, as it is just syntactic sugar over creating DOM elements manually using `document.createElement('div')`, for example). Anything written in react is simply javascript, and can be treated as such. React stays performant by utilizing what they call a virtural DOM. The framework utilizes this virtural DOM by comparing it with the real DOM to tell which elements need to be updated and which ones do not. This keeps react fast. 

React is not only limited to the web. React Native can be used to develop cross-platform mobile applications with the same languages you are familiar with in the web browser.

A note about Redux:

When reading about the react framework, one might hear the term 'redux' thrown around. Redux is not exactly a part of react and can be used seperately from it. Redux is a way to manage the state of an application. While react containers, (a type of react component), have state themselves: redux handles the state of the entire application by using a single point of truth, making the appliation easier to manage for a developer. If you don't know if you need redux, you probably don't, as stated on their website. If you choose to go deep in learning React you will eventually want to learn Redux as well.  However it is best to learn vanilla React first.

## Getting Started

Facebook has made getting started with react easy to do. They have developed a tool that takes care of configuring webpack and babel. It also has some boilerplate to get you started. This tool is called `create-react-app` and many tutorials will start with this application. To install, run `npm install -g create-react-app`. Since this is a utility to create, and download the needed components of a react app, it is a good idea to install this globally. Next you can run `creat-react-app my-app` to have the tool setup the application for you. When the utiltiy is done running, you should see some information on the screen on how to run the application. Follow these directions and your browser should open with a page saying "Welcome to React". You're ready to start hacking!

## Assignment
* https://reactjs.org/tutorial/tutorial.html - a tutorial from facebook themselves, uses `create-react-app`
* https://www.fullstackreact.com/30-days-of-react/ - a deeper dive into react
* https://sabe.io/tutorials/getting-started-with-react - might need to be removed..

## Additional Resources
