### Introduction

So, you've now learned a lot of juicy JavaScript, enabling you to make various components of your HTML/CSS page react to user actions and/or input. That's great! As you've seen, you can get your apps to do a lot of pretty cool things already, just using client-side JavaScript. You may have noticed, though, that there is still an important piece of the puzzle missing: unless you use [Local Storage](http://coding.smashingmagazine.com/2010/10/11/local-storage-and-how-to-use-it/), your app 'forgets' the user's preferences, as well as any other changes made, as soon as the page gets reloaded.

While Local Storage is great, it's not ideal: it only stores data on the computer from which the user is accessing the page. This approach does not allow for the app to 'remember' anything when the same user tries to access it again from a different device. For that, you're going to need a real backend.

### Learning Outcomes

By the end of this lesson, you should be able to:

- Explain which services are offered by Firebase
- Explain how to set up your app to use those services from Firebase Hosting
- Explain how to set up your app to communicate with and/or pass data to and from the various Firebase services

### OK, so... now what?

You can learn how to build a back-end later using [Node.js](https://www.theodinproject.com/paths/full-stack-javascript/courses/nodejs). For now, you can outsource your backend functionality to a Backend-as-a-Service (BaaS) company like [Firebase](https://www.firebase.com/) or [Apigee](http://apigee.com/). For this lesson, we'll be learning Firebase.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. [Explore the different services offered by Firebase](https://firebase.google.com/products). Pay particular attention to [Cloud Firestore](https://firebase.google.com/products/firestore) for now. You may or may not also want to use [Firebase Hosting](https://firebase.google.com/products/hosting) and/or any of the other services offered by Firebase, particularly [Cloud Storage](https://firebase.google.com/products/storage) and [Authentication](https://firebase.google.com/products/auth), but you probably won't need any of those for your first Firebase project.
2. Complete [this Google Codelab](https://codelabs.developers.google.com/codelabs/firebase-web/#0), which will walk you through setting up a sample app on Firebase step by step.

    <div class="lesson-note lesson-note--warning">
      <p>Some people have reported running into issues when doing the Firebase codelab, specifically at the emulator step. If this affects you you can skip it for now.</p>
    </div>

3. Go back to one of the previous projects (e.g. the library project or the to-do app), and [follow the Firebase setup guide](https://firebase.google.com/docs/web/setup?hl=en) to prepare it for interaction with a Firebase backend.
   - **Caution:** If you're _not_ going to be hosting your app on Firebase Hosting, but prefer to leave it where it is (e.g. on GitHub Pages), take a closer look at the [stackoverflow answer](https://stackoverflow.com/a/50799016) to add your github page into Firebase authentication domains. Then, use what you learned in the codelab to make your own app actually interact with Firebase.

</div>

### Knowledge Check

- [Which services does Firebase offer?](https://firebase.google.com/products-build)
- [How do you set up your app to use those services from Firebase Hosting and/or from an external host (like GitHub Pages)?](https://firebase.google.com/docs/web/setup?hl=en)
- [How do you get your app to communicate with and/or pass data to and from the various Firebase services?](https://firebase.google.com/codelabs/firebase-web#5)

### Additional Resources

This section contains helpful links to other content. It isn't required, so consider it supplemental.

- This [youtube video](https://www.youtube.com/watch?v=zQyrwxMPm88) to reinforce the learnings from [Google Codelab](https://codelabs.developers.google.com/codelabs/firebase-web/#0).
