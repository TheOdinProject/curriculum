# Social Share Button

This is a gem to helper you quick create a share feature in you Rails apps.

# Sites list

* Facebook
* Twitter
* Douban
* Google+
* Weibo
* QZone
* Tencent Weibo
* Renren
* Hi Baidu
* Kaixin001
* Google Bookmark
* Delicious
* Tumblr
* Plurk
* Pinterest
* Email

## Screenshot

<img src="http://l.ruby-china.org/photo/85fa930a43d622ba9653eb0f86df207c.png" width="220px" />

## Install

In your `Gemfile`:

```ruby
gem 'social-share-button'
```

And install it:

```bash
$ bundle install
$ rails generate social_share_button:install
```

## Configure

You can config `config/initializes/social_share_button.rb` to choose which site do you want to use:

```ruby
SocialShareButton.configure do |config|
  config.allow_sites = %w(twitter facebook google_plus weibo douban tqq renren qq kaixin001 baidu tumblr plurk pinterest email)
end
```

## Usage

You need add require css,js file in your app assets files:

`app/assets/javascripts/application.coffee`

```
#= require social-share-button
```

`app/assets/stylesheets/application.scss`

```
*= require social-share-button
```

Then you can use `social_share_button_tag` helper in views, for example `app/views/posts/show.html.erb`

```erb
<%= social_share_button_tag(@post.title) %>
```

And you can custom rel attribute:

```erb
<%= social_share_button_tag(@post.title, :rel => "twipsy") %>
```

You can also specify the URL that it links to:

```erb
<%= social_share_button_tag(@post.title, :url => "http://myapp.com/foo/bar") %>
```

For the Tumblr there are an extra settings, prefixed with :'data-*'
```erb
<%= social_share_button_tag(@post.title, :image => "https://raw.github.com/vkulpa/social-share-button/master/lib/assets/images/sprites/social-share-button/tumblr.png", :'data-type' => 'photo') %>
<%= social_share_button_tag(@post.title, :'data-source' => "https://raw.github.com/vkulpa/social-share-button/master/lib/assets/images/sprites/social-share-button/tumblr.png", :'data-type' => 'photo') %>
```
Those two above calls are identical.
Here are the mapping of attributes depending on you data-type parameter

<pre>
| data-type         | standard  | custom :"data-*" prefixed  |
--------------------------------------------------------------
| link (default)    | title     | data-title                 |
|                   | url       | data-url                   |
| text              | title     | data-title                 |
| photo             | title     | data-caption               |
|                   | image     | data-source                |
| quote             | title     | data-quote                 |
|                   |           | data-source                |
</pre>


## Demo

[http://ruby-china.org/wiki/about](http://ruby-china.org/wiki/about)
