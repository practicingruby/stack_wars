Stack Wars is an abstract board game currently being developed by Gregory Brown
(@seacreature) and Jia Wu (@sindhri)

The game itself can be played on Chess or Go board as long as you have some
stackable objects available to you (coins or bingo markers work fine). However,
the goal of this project is to build a computerized version so that anyone can
play without any special equipment.

See the RULES.txt file for an explanation of how the game works, and
follow the instructions below.

## To try out the game

First install the `stack_wars` Ruby gem

    $ gem install stack_wars

Next, step through a sample game to get a sense of how things work

    $ stack_wars demo

If the demo made sense, start up your own game. Make sure to have a friend
to share the keyboard with, as there are no bots yet. Rudimentary online
games can be done via tmux or screen, but only if you already know
how to use those tools and have a shared server handy ;)

    $ stack_wars

If the demo didn't make sense, you can review the rules once more:
(uses the `less` command line tool)

    $ stack_wars rules

If things still don't make sense, you may want to wait until this project is
farther along before playing with it further. But I'm happy to answer whatever
questions you might have: gregory.t.brown@gmail.com

_Please note that right now this game has a very rudimentary command line
interface and has not been tested on any platforms other than Ruby 1.9.2 /
Mac OS X 10.6. If you are trying this game out now, please make sure you
feel comfortable diving into the source code if things don't work as 
expected._

## To contribute to this project

There is a lot to be done on this project, and I'd be happy to accept contributions. 
If you'd like to help out, here's where to start:

    0) Make sure you've got a working install of Ruby 1.9.2 handy
    1) Fork the project on github: https://github.com/sandal/stack_wars
    2) Install Bundler if necessary (gem install bundler) [*]
    3) Run bundle install [*]
    4) Run ruby tests/suite.rb and verify tests are passing
    5) Run ruby examples/sample_game.rb and make sure it works as expected

    [*] Feel free to skip bundler instructions if you know what you're doing and
    would rather not use Bundler, there are no runtime dependencies on it.

Once you have gone through those steps, please email me at
gregory.t.brown@gmail.com letting me know that you'd like to contribute to the
project. If you had any trouble with the setup process, you can let me know at
that time. 

I will eventually post a roadmap publicly, but it's a bit early for that now. If
you get in touch with me, I'll work with you to figure out what you can work on
based on your interests and the needs of the project.

_NOTE: Contributors retain copyright to their work but must agree to release their
contributions under the [GNU Affero GPL version
3](http://www.gnu.org/licenses/agpl.html)_
