### Introduction

When a user makes a request to your application, your controller is the part of MVC that receives it and responds with the `.html.erb` view file. As you've been working on your applications so far, you may have been creating views with similar features and layouts. What if there was a way to only change the parts of our views that are different and not have to bother with updating content that we don't intend to change in the first place? We could cut down on loading times for the user and the amount of data our application has to send out.

That's where the concept of a **single-page application** comes in. This section will be about how we can use a framework known as **Turbo** to implement single-page application behaviour in our very own Rails application. This section covers a lot of tools and you may not fully understand them as you read through the first time. That's okay, consider this lesson to be a resource that you can refer back to when you actually begin using the  tools mentioned and get more of a visual as to what exactly is going on in your views.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- What an SPA is.
- What Hotwire is.
- Turbo and the four components of it.
- When to use a Turbo Frame.
- How to use Turbo Streams to update your pages.
- What Turbo Native is used for.

### Single-page applications (SPAs)

Before getting into Turbo, it's important to understand the concept of a single-page application, or SPA. A SPA is an
implementation for web applications that loads only a single web document. Rather than constantly replacing this document with a brand new one on every request, the website dynamically rewrites the current page with new information so that the page loads faster and feels more like a native application. A page refresh never occurs. Think about websites such as Gmail or Facebook where you see a brand-new email or timeline post without needing to refresh your page.

#### Creating a Single-page application in Rails

There are various JavaScript frameworks to help developers implement SPA functionality. You have possibly heard of some of them, such as AngularJS or ReactJS. However, Rails has its own solution to creating the experience of a SPA without writing JavaScript. This solution is a collection of libraries that are under the umbrella of Hotwire.

#### Hotwire

In Rails 7, all new applications include Hotwire by default. Hotwire is actually an umbrella term for three different frameworks. These frameworks are:

1. Turbo
1. Stimulus
1. Strada

The lesson you are reading now is all about Turbo. We will cover Stimulus in another lesson. Strada is a currently unreleased framework that aims to work alongside Turbo to deliver responsive mobile applications. You don't need to worry about Strada for the scope of this course, just be familiar with the name as you will see it mentioned from time-to-time.

### Turbo

Turbo is the heart of the Hotwire umbrella. The goal of Turbo is to use four different techniques to create the experience of a speedy SPA without having to write any JavaScript.

Here is a quick summary of the four Turbo techniques together. As you continue to read this lesson, we will look at each piece more in-depth

1. **Turbo Drive**: We already covered this in an earlier lesson.
1. **Turbo Frames**: Turbo Frames, like Turbo Drive, also help with fast navigation, but for predefined portions of a page. Rather than requesting an entire page, you can define a region of your HTML as a Turbo Frame and replace only the content inside of that region.
1. **Turbo Streams**: Turbo Stream delivers web page changes to instantly insert, update, or remove a region of the webpage. An example of this could be a user creating a new post and that post immediately inserts itself at the top of the post index feed without any refresh or redirection.
1. **Turbo Native**: Turbo Native is a technique that allows developers to achieve the same Turbo style transitions on a mobile app for iOS or Android.

### Turbo Frames

#### Creating a frame

Imagine a piece of paper and cutting out a small square hole in it. You could change what you see through the hole by swapping out another piece of paper behind it, but the rest of the paper will always look the same. That's the idea of Turbo Frames. Turbo Frames allow us to predefine a portion of our page to be replaced during a request. Any links or forms inside of our frame will make a special request that results in only changing the frame. A page can also have multiple Turbo Frames.

A frame is designated by wrapping a region inside of a `<turbo-frame>` element. Rails has a special helper for this, `<%= turbo_frame_tag %>`.

A basic Turbo Frame, using Rails helpers, may look like so:

```erb
<%= turbo_frame_tag "article" do %>
  Some content
<% end %>
```

which will generate:

```html
<turbo-frame id="article">
  Some content
</turbo-frame>
```

Note that the frames have an ID. The ID is how Turbo is able to identify a frame to find out which one is which.
With the Turbo Frame helper, you can substitute the ID for a variable. For instance:

```erb
<% @articles.each do |article| %>
  <%= turbo_frame_tag article do %>
    <%= article.title %>
  <% end %>
<% end %>
```

The above example will generate a turbo frame for every article. Each frame will have a unique id like `article_1` or `article_2` and all we had to include was our article variable.

#### Connecting to other frames

Now that we have our first frame, we can replace its content with a link that requests new frame content. All we have to do is put a link inside of the Turbo Frame, where the requested view *also* includes a Turbo frame with the **same ID**.

Let us replace the `/show` view with the `/edit` view on an article:

```erb
# views/articles/show.html.erb

...
<%= turbo_frame_tag @article do %>
  Content for our article!
  <%= link_to "Edit Article", edit_article_path(@article) %>
<% end %>
...
```

```erb
# views/articles/edit.html.erb

...
<%= turbo_frame_tag @article do %>
  Form to edit the article
  <%= link_to "Return to Article", @article %>
<% end %>
...
```

That's all we have to do! Turbo will recognize that our destination URL, the `/show` or `/edit` page, has a matching Turbo Frame and will replace the frame region with the content from the new page's frame. Something else to note is that this does work with forms as well. In our controller, if the `update` action contains `redirect_to @article`, then our Turbo Frame will be updated when we submit our form just like if we clicked a link.

Now that we have our matching frames that can replace their content, what about the content located outside of the frame? Anything outside of the frame does not change. If we were going from `/show` to `/edit`, then the content outside of the frame would still be the same content of the `/show` page and we would not receive any content from outside of the `/edit` frame either. We did not navigate to a new page, we only requested new HTML from another route and inserted it into our current page. The current `url` also does not change. We will stay on the `/show` path, and if we refresh, we would still see the `/show` view. (Note that it is possible to change this default behaviour by making use of Turbo Drive's `data-turbo-action` to advance the browser history and update the current `url`.)

#### Breaking out of a Turbo Frame

Sometimes you may have a link inside of the Turbo Frame that you want to act as a normal page navigation. To do so, add `data-turbo-frame="_top"` to the element. An example with a Rails link helper:

```erb
<%= link_to "Return to Article", @article, data: { turbo_frame: "_top" } %>
```

#### Targeting a Turbo Frame from outside

We can also do the opposite. We can make a link that exists outside of our Turbo Frame act as if it was inside of the Frame and update it. This time, we set the `turbo-frame` data attribute to point to the ID of the specific frame. Lets say we want to designate a turbo frame to show either a list of posts or a list of images:

```erb
<%= link_to "Show Posts", posts_path, data: { turbo_frame: "list-region" } %>
<%= link_to "Show Images", images_path, data: { turbo_frame: "list-region" } %>

<%= turbo_frame_tag id="list-region" %>
```

Clicking either of the above links will send a request to the respective path and return the content inside of our `"list-region"` frame.

#### Src & lazy loading

Frames can be given a `src` attribute. When this is supplied, the frame will be populated after the initial page load by making a separate request to the associated path. We can also wrap placeholder content inside of this `src` frame to create a [skeleton placeholder](https://uxdesign.cc/what-you-should-know-about-skeleton-screens-a820c45a571a).

For example:

```erb
...
<%= turbo_frame_tag id="Articles", src: articles_path do %>
  <div>
    I am a placeholder! After the request to articles_path is finished,
    I will be replaced with the content inside of that page's turbo frame
    with the id of "Articles".
  </div>
<% end %>
```

We can also make our frames **lazy loaded**. A lazy loaded frame will only fetch its content when it becomes visible on the page. We make a frame lazy load by adding `loading=lazy`. A frame with `loading=lazy` *must* also have a `src:` attribute to fetch from, or else it will not do anything. Using our previous example:

```erb
...
<%= turbo_frame_tag id="Articles", src: articles_path, loading: "lazy" do %>
  <div>
    I am a placeholder! I will be replaced when a user scrolls down to see me on the page!
  </div>
<% end %>
```

### Turbo Stream

Now we know how to set up our views to use Turbo Frames, but what about content that is being changed by our users? We can't put a Turbo Frame around something that doesn't exist yet. That's where Turbo Stream comes in. Turbo Streams send page changes as HTML wrapped in `<turbo-stream>` elements. Turbo Streams specify an action to perform and the target ID of the DOM element to update with this action. For instance, a Turbo Stream where `action="replace"` and `target="body"` would replace the HTML element where `id="body"` with the new element being delivered over Turbo Stream. These streams can be sent in response to either a direct browser request, or by broadcasting over a websocket connection. This lesson will stick to the browser request implementation. Turbo Streams can take the form of 7 different actions:

- Append
- Prepend
- Before
- After
- Replace
- Update
- Remove

Turbo Streams are delivered by use of our controller. Just like how your users make `html` requests and receive `view.html.erb` files, your users can receive `view.turbo_stream.erb` files. These are not standalone view files as you know them, they only contain a few lines and are a way of sending the user a Stream response instead of a new page.

#### Our first Turbo Stream

Let's say that we have made a website where users can create posts. By adding a `turbo_frame` with a `src:` attribute that points to our `new_post_path`, and our `new` post view being wrapped in a `turbo_frame_tag` with a matching `id`, we can include our `new` action form on the same page as our `index` feed. It may look something like this.

Our `index` view:

```erb
# views/posts/index.html.erb

<%= turbo_frame_tag id="new_post", src:new_post_path %>
<div id="posts">
  <%= render @posts %>
</div>
```

Our `new` page with it's form:

```erb
# views/posts/new.html.erb

<%= turbo_frame_tag id="new_post" do %>
  <%= form_with model: @post do |form| %>
    <%= form.label :body %>
    <%= form.text_area :body %>
    <%= form.submit %>
  <% end %>
<% end %>
```

Our `_post` partial that every post will be rendered with:

```erb
# views/posts/_post.html.erb

<div>
  <%= post.body %>
</div>
```

Our controller:

```ruby
# controllers/posts_controller.rb

class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
```

This will result in only the `posts#index` page loading initially and *then* another request being made to the `posts#new` action of our controller to insert the form! This also keeps our code DRY because if instead we opted to add the form by use of a partial on the index page, we would still have to repeat the `posts#new` controller action during the `posts#index` action.

However, if a user is to submit a post right now, something weird happens! The form window goes away, but there's no error. Where did the post go? When we refresh the page, we see that the post did submit. What's happening here is that Rails doesn't know you are going to want a Turbo Stream so it can't automatically add your post yet. Instead it tries to redirect you to the page you are already on. **Turbo Drive** intercepts this and loads a cached version of the page, which does not have our form content in it, so the form goes away.

All of this looks very scary and like something is wrong, but it's fine. All we have to do is set up our Turbo Stream and the pieces will all begin to work together again.

#### Turbo Stream in the controller

For starters, we tell our controller that we want to accept a Turbo Stream format. This is done in the same way as accepting a format such as JSON. Our create action may now look like:

```ruby
# controllers/posts_controller.rb
...
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end
```

What's going on here? Well, the `respond_to do |format|` block is our way of telling the controller to do more than just `html` format requests. If our post saves, we would like the format we respond with to be a `create.turbo_stream.erb` format. If it does not save, we would like to respond with the `new.html.erb` file being rendered. Notice the difference in the formats is the file extension that is after the name and before the `.erb`.

We include the `422 Unprocessable Entity` error code with our response upon an unsaved post so that Turbo Drive knows what to do with it and our form window won't disappear anymore.

Now all we have to do is create our `create.turbo_stream.erb` file to respond with.

#### Turbo Stream template

You create your Turbo Stream file inside of your `views` folder the same way as any other view. In this example, it would be located at `views/posts/create.turbo_stream.erb`. Our view file will look like this:

```erb
<%= turbo_stream.append "posts", @post %>
```

That line is all we need! What this does is create a Turbo Stream packet with the `append` action. The target of the action is `"posts"`. This is the `<div>` with the `id="posts"` that contains all of our posts. Turbo Stream will locate the `<div>` and append our brand new `@post` to the bottom. Our newly created `@post` will even use the `_post.html.erb` partial to be in the proper layout as all of our other posts. For that, you can thank the Rails naming convention. If you are breaking from Rails convention, you can specify a partial to use inside of your `turbo_stream` template.

Now that we have added the `format.turbo_stream` response to our controller and our `create.turbo_stream.erb` file, we can now create a post and watch it append to the list.

#### Additional Turbo Stream tips

There's no time to get more in-depth on how Turbo Stream works in this lesson, but here are some topics for you to begin your personal research
if you would like to learn more:

1. You can chain multiple `turbo_stream` actions in one `turbo_stream.erb` file, like if you wanted to append to one region and
    update another region at the same time.

1. You don't *have* to create a separate layout file for your Stream formats. For instance, we could instead change the line in our controller to:

    ```ruby
    format.turbo_stream { render turbo_stream: turbo_stream.append('posts', @post) }
    ```

    However, you shouldn't do this for anything complex or chained, as explained in this [comment by one of the maintainers of Hotwire](https://github.com/hotwired/turbo-rails/issues/77#issuecomment-757349251).

1. You may have noticed that when you submit a new Post, the text box doesn't clear out. You need to reset the submission element in order for it to be empty again. Hotwire has a remedy for this problem by including Stimulus, a light JavaScript framework. Don't worry about Stimulus for this example though, the next lesson will cover how to write and make use of Stimulus Controllers.

### Turbo Native

The final piece of Turbo is something that you don't need to know much about for this course, other than it exists. Turbo Native is useful for wrapping your application inside of a mobile-friendly shell. If you are interested in mobile development and how you can use Turbo with it, you may enjoy looking at the demos for [iOS](https://github.com/hotwired/turbo-ios/blob/main/Demo/README.md) and [Android](https://github.com/hotwired/turbo-android/blob/main/demo/README.md) phones.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Read sections 1, 2, and 3 of Bloomreach's [What Are Single Page Applications and Why Do People Like Them So Much?](https://www.bloomreach.com/en/blog/2018/07/what-is-a-single-page-application.html#whatssingle-page-application) article
1. Watch the [Hotwire Demo Video](https://www.youtube.com/watch?v=eKY-QES1XQQ)
    - We have only covered content up until the 5:40 mark, but you may continue watching past that point to become more familiar with other aspects of Hotwire that we will be covering in upcoming lessons.
    - The video is edited to be a very quick showcase. Don't worry about trying to pause and use this video as a tutorial. Just sit back and use this demo to watch how Turbo Drive, Frames, & Streams come together visually.
1. Skim through sections 1-4 of the [Turbo Handbook](https://turbo.hotwired.dev/handbook/introduction)
    - This Handbook is written to be backend-agnostic, meaning that the code you will see is pure HTML and not Rails tags, but it still is a useful resource for referencing how Turbo works.
1. Take a quick glance at the Turbo-Rails gem [RubyDoc info page](https://www.rubydoc.info/gems/turbo-rails/1.0.0)
    - This resource covers the Rails-specific syntaxes and tags you can use for Turbo. You don't need to read anything now, just know that it exists so you can come back to it when you need to figure out how to use a specific piece of Turbo in your applications.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- <a class='knowledge-check-link' href='#single-page-applications-spas'>What does SPA stand for and what is it?</a>
- <a class='knowledge-check-link' href='#hotwire'>What is Hotwire?</a>
- <a class='knowledge-check-link' href='#turbo-frames'>How do we use a Turbo Frame?</a>
- <a class='knowledge-check-link' href='#turbo-stream'>How do we set up Turbo Streams?</a>

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- [Turbo Reference Information](https://turbo.hotwired.dev/reference/drive)
- Check out this tutorial on [Turbo Frames and Turbo Stream](https://www.hotrails.dev/turbo-rails/turbo-frames-and-turbo-streams) to build a quotes editor.To get started right away, enter in command line `rails new quote-editor;rails scaffold g quotes` and in migration add `t.string :name` and then `rails db:migrate`.
- [Official Hotwire Forums](https://discuss.hotwired.dev/)
- Remember you can use your browser developer tools to [watch network activity](https://developer.chrome.com/docs/devtools/network/) and see what is happening with your Turbo requests and responses. If something doesn't work, check to see if your browser received a Rails error message. Look for a red font.
