This game engine is based on the "Game of Islands" described in [*Functional Web Development with Elixir, OTP, and Phoenix*](https://pragprog.com/book/lhelph/functional-web-development-with-elixir-otp-and-phoenix),
by Lance Halvorsen (Pragmatic Bookshelf).

## Recommendations
If you want to start your Elixir path via this book, consider these things to make your life easier:

### Familiarize yourself with Erlang
[Learn Erlang in Y Minutes](https://learnxinyminutes.com/docs/erlang/) doesn't take too long to run through. Erlang
syntax differs from Elixir (as you can see starting at the very beginning of this tutorial), but it's probably a good
idea to see the foundations, as the core concepts are largely the same. And because you can still call erlang libraries
from within elixir.

And [Learn You Some Erlang for Great Good!](https://learnyousomeerlang.com/) is a classic.

### Enable iex history
If you are used to bash history commands across hours/days/weeks of work, add this line to your
shell profile: `export ERL_AFLAGS="-kernel shell_history enabled"`. Otherwise, when you close `iex` that work is gone.

The built-in tab completion in `iex` is pretty smart, and newly created modules are available as soon as the file is
saved if you add `remix` per below.

### Add automatic compilation on file changes
Add a development dependency for [remix](https://github.com/AgilionApps/remix), so that while working through examples,
your code is recompiled after each file save and ready to use by the time you've tabbed back to your terminal.
If successful, you'll see: `Compiling 1 file (.ex)`, and a compilation error message otherwise.


## TODO
- Add tests!
- Add airdrop types (patterns that don't just cover one tile) & different tile images
- Add canned settings for difficulty levels.


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `airdrop_engine` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:airdrop_engine, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/airdrop_engine](https://hexdocs.pm/airdrop_engine).
