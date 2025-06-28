### Introduction

In previous lessons we covered both stateful authentication (demonstrated using sessions) and stateless authentication (using JWTs). You will often see both approaches out in the wild, which may not necessarily be implemented with sessions or JWTs specifically, but why the options? What are the pros and cons of each? How should I authenticate my applications?

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Compare pros and cons of stateful and stateless approaches to authentication.

### Stateful vs stateless

Stateful authentication involves authentication data being stored server-side, such as in a session, while stateless authentication stores the data client-side, such as in a JWT. Why might one pick a stateless solution over a stateful one or vice versa?

Stateless solutions reduce the amount of database calls needed per authenticated request, as a call is not needed to check the database for a matching session - the data is already there in the request and need only be verified. But is this actually a problem? At what point does this additional database call become a performance bottleneck in a stateful solution? While much larger products built with more complex architectures may well need to consider this, in all honesty, this is almost certainly not going to be an issue for many small projects, certainly not curriculum projects (and if it genuinely does, congratulations on the successful site!).

But is there actually a negative to using something like JWTs for stateless authentication? Potentially: **authorization** and **invalidation**.

### Assignment

<div class="lesson-content__panel" markdown="1">

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- []()

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
