### Introduction

With all the concepts we have learned in this series, you are more than ready to create your own react applications. However there are a lot of other, more advanced concepts out there, which we haven't really discussed, but which I neither want to withhold from you.

I want to use the chance in this lesson and introduce you to a few more advanced concepts and give you some tips for your path as a react developer.
Don't worry, you won't have to understand all the concepts mentioned in this lesson right away, that's why they are called advanced ;).

This lesson is meant as a checklist. Once you are secure with the basics, come back to this lesson and work through the advanced concepts. This doesn't have to be now, if you first want to move ahead in the curriculum, apply you knowledge or feel like one is not worth learning right now just skip it and come back another time when you are ready.

I will not go into detail with the below mentioned concepts, because by now you should have enough experience with google and stackoverflow, and you should also have enough dicipline to work yourself through new problems.

Good Luck!

### Guide to advanced react

# 1. PropTypes

One common discussion about Javascript is whether it would be better if you could declare types on variables or properties. Many programmers agree that the pattern of declaring types, which you have in many other programming language is rather good than bad, because it prevents you from making errors. Therefore, react provides the possibility to declare types using PropTypes. And if that's not enough for you, you could also use typescript with react.

# 2. Styled Components

If you start writing larger applications you will, with certainty encounter the problem that you might want to style buttons or anything else across your application almost the same, but not entirely similar. One way you could solve this problem is surely through code dublication (writing even the most basic css for each button). However, this wouldn't be a very good code style. The styled components package provides a cleaner way to do this. It allowes you to give some default stylings to html elements, meaning you define a button with some basic styling and reuse this button throughout you application. This way there is no code dublication and it makes you application a lot more scalable.

# 3. Redux

You might have already heard about Redux. Redux is the most popular state management system out there. It is not a part of react, but the two can be very easily combined, and together they make up an extremely powerful duo. It takes a little getting used to, and I only recomment it when your application is not too small, because it requires quite some setting up.

# 4. Higher order components

Higher order components are in the end just components that take in another component and return a third component. This can be extremely useful.

# 5. withRouter (history, match, children object)

withRouter is one example for a higher order component, and it is definitively worth looking into it. Through wrapping withRouter around one of your components, this component will get access to your history, match and children objects, which provide some additional sugar :). For example you could use the history object to push a user from one to another route.

# 6. Hooks (We only discussed a few, but there are a lot more out there)

There are quite a lot of hooks out there, with the number rather increasing than decreasing. As you have seen in previous lessons and as already stated before, it seems like the react team wants us to use more functional components with hooks in the future, so it is definitively worth getting to know all those hooks.
