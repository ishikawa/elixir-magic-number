# MagicNumber

MagicNumber is the module to determine a file's type from its [magic number](https://en.wikipedia.org/wiki/Magic_number_(programming)#Magic_numbers_in_files).

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add magic_number to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:magic_number, "~> 0.0.1"}]
end
```

  2. Ensure magic_number is started before your application:

```elixir
def application do
  [applications: [:magic_number]]
end
```
