### Introduction

Rails has always promoted itself as a framework that makes building a web application easy. But in a world built around the demands of users expecting lightning fast responses as well as increasingly complex UI, it wasn't easy for Rails to offer a compelling vision for how they saw a way through that complexity while sticking to core Rails philosophies. However, just before the release of Rails 7 we finally got a glimpse of how the Rails team saw the future of meeting these demands. Hotwire!

Hotwire is actually an umbrella term for three different frameworks. These frameworks are:

1.  Turbo
2.  Stimulus
3.  Strada

Stimulus is something we'll cover later and you don't need to worry about Strada for the scope of this course, just be familiar with the name as you will see it mentioned from time to time.

Turbo itself is also an umbrella term for several different techniques for creating fast and modern web applications. The technique we're going to focus on here is the one whose behaviour is part of Rails' core behaviour, Turbo Drive. The other techniques we'll cover in the Advanced Turbo lesson later.

Links and Forms are the bedrock of most web applications. You need links to navigate around your site and forms to allow users to submit information to you. Turbo Drive is how Rails handles these in your applications.

If a lot of what follows seems confusing, don't worry! A lot of Turbo Drive happens under the hood and therefore it means we often need to discuss the concept rather than the implementation. This can make it harder initially to grok, but luckily it does also mean you can often just go about your business and never have to actively think about it.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- The purpose of Turbo Drive.
- How Turbo Drive handles page navigation.
- The two kinds of page visit types in Turbo.
- How to disable Turbo Drive.
- What Turbolinks is.

### Turbo drive

Turbo Drive is the portion of Turbo that accelerates overall page navigation. Turbo Drive watches for when a user clicks a link or submits a form, handles the request being made by the user, and then updates the page for the user without a full reload! This is the default behavior without any set up required. However, it is still important to understand what exactly Turbo Drive is doing in case you need to manually modify or disable its behavior in some portions of your web page.

#### Page navigation

Turbo Drive defines page navigation as a *visit* to a *location* (URL) with an *action*.

A visit is the navigation lifecycle that begins when a user clicks a link and lasts until the page is rendered. This includes the HTTP request, the user's browser history being updated, restoring the page from cache (if applicable), rendering the final response, and updating the user's scroll position.

There are two kinds of visits:

1.  **Application visit**, a visit with a Drive action of *advance* or *replace*.
2.  **Restoration visit**, a visit with a Drive action of *restore*.

#### Application visit

The application visit lifecycle can be summarized as:

1.  Application visits begin when a user clicks a Turbo Drive enabled link (remember, Turbo Drive is enabled on links by default!).
1.  An HTTP network request is issued. Turbo Drive receives it and will render the HTML.
1.  If possible, Turbo Drive will use the browser's cache to render a preview of the page immediately after the visit begins, using the HTML for the previous visit of the same URL.
1.  The browser history is updated to reflect this page navigation. The way it is changed is determined by the visit action.
    * **Advance**: This is the default action and will result in a new entry being added to the browser history.
    * **Replace**: This action replaces the most recent browser history entry with the new location.

To change the action of a Turbo Drive link, you can use data attributes inside of your Rails link tags

~~~erb
<%= link_to "Edit Article", edit_article_path(@article), data: { turbo_action: "replace" } %>
~~~

which will generate:

~~~html
<a href="..." data-turbo-action="replace">Edit Article</a>
~~~


#### Restoration visit

The restoration visit lifecycle can be summarized as:

1.  Restoration visits begin when the user navigates using the browser's forward & back buttons.
1.  If possible, Turbo Drive will use the browser's cache to render a preview of the page immediately after the visit begins. Otherwise, it will retrieve a fresh copy of the page over the network.
1.  The browser's scroll position is saved on every page before navigating away and will return to this saved position.

Restoration visits are visits with the action of *restore*. This is used by Turbo Drive internally and you **should not** annotate a link with an action of restore.

#### HTTP request methods

By default, link clicks are sent with `GET` requests. However, Turbo Drive will scan `<a>` tags in your application for the `turbo-method` attribute to override the `GET` action.

For instance:

~~~erb
<%= link_to "Delete Article", article_path(@article), data: { turbo_method: "delete" }  %>
~~~

which will generate:

~~~html
<a href="..." data-turbo-method="delete">Delete Article</a>
~~~

This creates a link that will use the `DELETE` method. However, it is suggested that you use a button or form for anything that isn't a `GET` request

#### Disable turbo drive

There will be times where you do not want Turbo Drive to control navigation and want a full page reset.

You can disable Turbo Drive by adding `data-turbo="false"` directly on your links or on the parent containing them.

For instance:

~~~erb
<div data-turbo="false">
  <%= link_to "foo", "bar" %>
  <%= link_to "baz", "qux", data: { turbo: "true" } %>
</div>
~~~

In the above example, we created a parent div with `data-turbo="false"`, which disables Turbo Drive on all elements inside of it. However, we also added `data: { turbo: "true" }` to the second `link_to`. This will turn Turbo Drive back on for that particular element.

This showcases that you can disable and re-enable Turbo Drive in regions of your website and select specific elements to enable or disable it on. Remember that when using ERB tags (like `link_to`) we use the syntax style of `data: { foo: "bar" }` rather than the HTML style of `data-foo="bar"`.

### Forms

We cover Rails forms much deeper later, but because they are entwined with Turbo Drive we do need to cover some common information that will come together in the forms lessons that follow.

If you don't understand some of the information as it is explained below just wait until the Form Basics lesson and it should all come together.

#### Form submissions

While most link requests are issued as GET requests, forms are different. You often submit forms as a POST, PATCH or DELETE request in order to manipulate some data that lives on the server.

Turbo Drive intercepts all Form Submissions by default and submits them to the server on your behalf. As we advance into the form lessons, you must remember that Turbo expects the server to return an HTTP status of HTTP 303 or, in other words, a redirect.

Think of it like this, after you submit a form usually you want to be directed somewhere afterwards. That could be back to the same page with a blank form ready for another submission, or it could be to view the resource you just created with the form, but you expect to be redirected away from the current page with the completed form on it. There are two exceptions to this expectation:

1. When the server responds with a 4XX status code. This is common if you submit a form with the wrong information in it and the server will respond with a 422 Unprocessable Entity status.
2. When the server responds with a 5XX status code of which the most common is 500 Internal Server Error.

If the server responds with any other status, Turbo won't be able to handle it and it will appear as though nothing has happened as the page won't update. The one thing to keep in mind with this is the HTTP 200 status. This is returned when a request has succeeded so it might seem strange at first that Turbo can't handle this type of request.

The reason is that if you've ever submitted a form and refreshed the page before the POST action completed you get a popup from your browser asking if you want to submit the form again. Your browser does this because when you refresh you've actually issued a new request and the server has responded with a 200 status because the request was ok and handled without an error or redirect. Browsers handle this case by offering to submit the form again as a POST request for you. Because Turbo has intercepted the request you won't get that default browser behaviour and Turbo cannot replicate this and it has two options:

1. It can either stay on the current URL in your browser; or
2. It could try and navigate to the action that the form submits to.

If it navigated to the form action it would do so as a new GET request, but since forms issued POST requests the server might not be set up to handle a GET request to that URL and you'd get an error. Because Turbolinks didn't handle form submissions this is what actually happened in previous versions of Rails. This is why Turbo Drive went with option 1, it stays on the current URL in your browser and therefore it appears to the user that nothing has happened. You must therefore ensure you always respond with one of the valid status codes mentioned above with forms.

### Turbolinks

Before we finish up, we should briefly mention the predecessor to Turbo, Turbolinks. Turbolinks is **no longer in active development**! Despite that, it's still worth mentioning as it has been around for a while (its first major release was 2013) and it's possible that you will encounter existing applications or online articles that mention Turbolinks. The goal of Turbolinks was to capture the request for any clicked links in your web application and, if that link was to another page in your web app and not to an outside resource, then Turbolinks would keep the current page instance alive and only swap out the content between the `<body>` tags of the document. It didn't require a full page reload (and was therefore faster) because it didn't have to download any resources in the head part of the document when they were unlikely to have changed.

This only applied when navigating pages with links, it did not intercept form submissions. While Turbolinks is no longer actively developed, the concept behind it has evolved into a new framework now known as Turbo.

To reiterate, Turbolinks is the **predecessor** of Turbo, and **Turbo is not shorthand for Turbolinks**. They are two different entities.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Read chapters 1 and 2 of the [Turbo handbook](https://turbo.hotwired.dev/handbook/introduction). Focus on ensuring you understand around link navigation and how that works as we'll cover forms later.

</div>

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
