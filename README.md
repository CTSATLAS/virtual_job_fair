# ATLAS v4

## Dependencies
* Ruby 2.4.0+
* Redis
* PostgreSQL
* [Forego](https://github.com/ddollar/forego)
* [MailCatcher](https://mailcatcher.me)

## Setup
* Clone the repo
* Add `PATH=".git/safe/../../bin:$PATH"` to your `.bashrc` or `.zshrc` ([Why?](https://robots.thoughtbot.com/but-i-dont-want-to-bundle-exec))
* Run `./bin/setup`
* Configure `config/database.yml` to point to your development database

## Starting the server
We use [Forego](https://github.com/ddollar/forego) to run the development server *and* all of our services (e.g. Redis and mailcatcher).

Run `forego start` to start all the processes

## Style Guidelines
We'll be using strict style guidelines in ATLAS v4 so we don't run into all the issues from ATLAS 3.

* [Javascript](https://github.com/thoughtbot/guides/tree/master/style/javascript)
* [Html](https://github.com/thoughtbot/guides/tree/master/style/html)
* [Rails](https://github.com/thoughtbot/guides/tree/master/style/rails)
* [Ruby](https://github.com/bbatsov/ruby-style-guide)
* [RSpec](https://github.com/thoughtbot/guides/tree/master/style/testing)
* [Sass](https://github.com/thoughtbot/guides/tree/master/style/sass)

## Contributing
* Create a feature branch using [gitflow](http://nvie.com/posts/a-successful-git-branching-model/), e.g. `feature/AT-xx-feature-name`
* Create a pull request immediately to discuss the feature
* Code the damn thing! (**Don't forget to test!**)
* [Write good commit messages!](http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html)

If the feature is complete and all specs are passing we'll merge the pull request and deploy.

## Running the specs
From the project directory, run `rake` to run all the specs together or `rspec /path/to/file` to run indvidual specs.

## Deployment
`cap <environment> deploy`

Run `cap -vT` for a list of all capistrano commands