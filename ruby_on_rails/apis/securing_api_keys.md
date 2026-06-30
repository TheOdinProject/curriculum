### Introduction

When using any service that requires you to generate an API key of your own, it is important to hide them away carefully so that no one else other than you have access to it. [API keys leakage is one of the most common security concern in software development](https://rafter.so/blog/api-keys/api-key-leaks) and you do not want to be a victim of data scrapes.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- How Rails store credentials.
- Understanding the role of Rails' `master.key`.
- How to add and edit credentials in Rails.

### Understanding Rails crendentials

In the usual spirit of Rails' conventions over configurations, Rails has a specific way of working with custom crendentials, such as our API keys. All of your Rails app's secrets are stored inside `config/credentials.yml.enc`. If you have ever inspected this file, you might see a jumble of text like this:

```text
fx1v9po/VKkSzpFukeB1cSMQCGz31PWaVb8yChd4d2g0WyEBz2Q5KnUEmc+sDoYX26bPLVvPWoRvpVd+rbIg3S00O+wzjnAM2o0ZgONtqwRR/K10DiZaW33ootkBixKnL2U8HCPWPRyQ94pXlMMsBF2t/JKBydnp1fdL25uvDnkbLfyLMXdLXEout2McpPtGEwmHmTejXHk5iskpPPXFDcfTy/ldkqCCcG7IE/CF2IPaoxqilYe0UxiQvhvM9EU+sdb2E5qrj02Xjt2rXOoCKyXOVa+78kcx3Z4Q68oXvPrTAjZuf1nyr+ueJlD1++Ar+DOT9nteJi8HpXvjKIr4TrTUVZ6NZ+zJ9eebCrMNDNw7Ra+PnUWwCzne7ejFdfPptOMfU8YOsoHjqr2sICOQMjz8E/LITRac7oXGHZuuaiy71a9fg4YfYbem5D4jgHsq0HqCnbYJ9BB6OJP5EN1XwS8dqZLI9gsjSktnZ+7BdNr0NQtXJ9X8C867--ZCouXjk9OmBUGyuq--kTfKiGSSyfeT6uPNwVboKA==
```

These are our secrets, [encrypted](https://www.cloudflare.com/learning/ssl/what-is-encryption/), thanks to Rails. Your secrets can be decoded by using your own `master.key` file. This is the key that Rails will use to decrypt your secrets which will be used throughout your app. Neat, right?

<div class="lesson-note lesson-note--critical" markdown="1">

#### Protecting your master key

By default, Rails has already taken care to not commit `master.key` file. However, do make sure this key NEVER gets exposed. Otherwise, your data can be left exposed.

</div>

### Adding secrets

Let's create a new Rails app and add some secrets to it!

```bash
rails new odins_secrets -d postgresql
cd odins_secrets
```

Before adding anything though, chances are your computer is using vim as its default text editor, but we want to use VSCode to modify our secrets instead. Modify your text editor by adding it into your bash profile like this:

```bash
echo 'export EDITOR="code -w"' >> .bashrc"
```

By doing so, anytime we want to modify our secrets, we'll be able to use VSCode.

Now for the fun part. Let's store some secrets! First, run this command:

```bash
bin/rails credentials:edit
```

VSCode will automatically open up a decrypted version of `credentials.yml.enc`. You'll notice there is already a `secret_key_base` key already available in this file. This key is responsible for different kind of encryption operations throughout your Rails app, keep that in mind and do not modify it. Let's say we want to protect these secrets:

```yaml
# ...
my_api_key: MYKEY
test:
  test_key: SOMEKEY
```

Once you had those secrets down, save the file and close it. You'll see the terminal saying:

```bash
File encrypted and saved.
```

Now your secrets are protected! You can now launch Rails' console and access these values.

```ruby
Rails.application.credentials.my_api_key # => "MYKEY"
Rails.application.credentials.test.test_key # => "SOMEKEY"
```

If you ever need to modify existing or add new secrets, just run `bin/rails credentials:edit` again and follow the same process above. Note that accessing non existing key will silently return `nil`. If you want an error to be thrown, make sure to add a `!` at the end.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. [Rails' custom credentials guide](https://guides.rubyonrails.org/security.html#custom-credentials) should sum this lesson up just fine.
1. [WebCrunch's guide on Rails encrypted credentials](https://webcrunch.com/posts/the-complete-guide-to-ruby-on-rails-encrypted-credentials) also talk about environment-specific crendetials, should you need to have environment-specific variables.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [How does Rails manage secrets?](#understanding-rails-crendentials)
- [How do you add or modify secrets?](#adding-secrets)
