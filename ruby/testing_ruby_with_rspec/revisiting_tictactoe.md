### Introduction
Now you have some experience with writing tests. Congratulations! Practice makes perfect, so here's another assignment.

This time, you're going to go back to your Tic Tac Toe assignment and write tests for it.

### Assignment

<div class="lesson-content__panel" markdown="1">

  1. Write tests for your [Tic Tac Toe project](/lessons/ruby-tic-tac-toe). In this situation, it's not quite as straightforward as just coming up with inputs and making sure the method returns the correct thing. You'll need to make sure the tests that determine victory or loss conditions are correctly assessed.
      1. Start by writing tests to make sure players win when they should, e.g. when the board reads X X X across the top row, your `#game_over` method (or its equivalent) should trigger.
      1. Test each of your critical methods to make sure they function properly and handle edge cases.
      1. Use mocks/doubles to isolate methods to make sure that they're sending back the right outputs.

</div>

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- Stack Overflow has an [RSpec Mock Object example](http://stackoverflow.com/questions/3622604/rspec-mock-object-example).
- Youtube has a [helpful video by Sandi Metz about Ruby testing](https://www.youtube.com/watch?v=URSWYvyc42M).
- Tutorials Point has an article about [RSpec Writing Specs](https://www.tutorialspoint.com/rspec/rspec_writing_specs.htm).
