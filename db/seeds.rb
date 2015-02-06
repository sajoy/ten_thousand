
Category.create(name: "lesson")
Category.create(name: "project")
Category.create(name: "class")

# rake db:seed doesn't work, rcv error:
# rake aborted!
# NameError: uninitialized constant Category

# research says something about changing threadsafe! ?
# http://hightechsorcery.com/2013/01/fixing-uninitialized-constant-errors-in-rake-tasks-when-using-rails-threadsafe-mode/
