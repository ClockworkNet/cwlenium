# CWlenium

Powered by [Zalenium](https://github.com/zalando/zalenium)

## What is it?

Selenium is the industry standard language for driving web browsers using the WebDriver protocol. Every major browser vendor supports this, but, every browser requires separate executables to attach to browsers. Zalenium addresses this issue by providing an up-to-date Selenium Grid with a Firefox and Chrome browser. This abstracts the pain of maintenance for handling our own internal grids.

This provides scaffolding for new automation work using Ruby 2.3, Cucumber 3, and is complete with a Zalenium installation. 

## Getting started

Ensure you have a recent version of Docker installed

1. Clone this repo
2. Navigate to this repo
3. `bin/run_tests.sh`

### What happened?

Some docker images were pulled (`ruby:2.3`, `elgalu/selenium:3`, and `dosel/zalenium:3`). Then, Zalenium was started up. Gemfile dependencies are installed in the Ruby container, and then Cucumber is then kicked off and runs each test defined in `tests/features`. The sample feature creates a new browser, navigates to a page, and then verifies the page title.

You can view videos of completed tests by navigating to the [Dashboard](http://localhost:4444/dashboard).

### What else can you do?

* `docker-compose up -d zalenium` Starts the Zalenium instance.
* `docker-compose logs -f zalenium` will display logs
* `docker-compose run tester` starts the cucumber tests
* `docker-compose run tester pry` starts a Pry REPL instance on the Ruby container
* `docker-compose run tester bash` starts a bash instance on the Ruby container

## Prefer to work on tests without docker?

Kick off tests like this:
1. `cd tests`
2. `LOCAL=1 cucumber`

## Questions?

Contact [Sonja Leaf](mailto:leaf@clockwork.com)
