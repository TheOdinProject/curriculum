### Introduction
In Ruby, Enumerable is a module that provides a set of methods that are available to collection classes, such as Array or Hash. The basic requirement to use enumerable methods is that the collection class in question must have an #each method.

Collection classes that want to take advantage of Enumerable methods must implement an `#each` method. This method must yield successive members of the collection, which allows Enumerable to do it's thing. Therefore, while `#each` is *not* an Enumerable method, it is the basis for how they work.
