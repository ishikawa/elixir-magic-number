# MagicNumber

[![CI Status](https://travis-ci.org/ishikawa/elixir-magic-number.svg?branch=master)](https://travis-ci.org/ishikawa/elixir-magic-number?branch=master)

MagicNumber is the module to determine a file's type from its [magic number](https://en.wikipedia.org/wiki/Magic_number_(programming)#Magic_numbers_in_files).

**It is currently heavily under development**, The public API should not be considered stable.

## Installation

The package can be installed from [Hex](https://hex.pm/) as:

Add magic_number to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:magic_number, "~> 0.0.1"}]
end
```

Ensure magic_number is started before your application:

```elixir
def application do
  [applications: [:magic_number]]
end
```

## Usage

```elixir
% iex -S mix
...
iex(1)> content = File.read!("sample.gif")
<<71, 73, 70, 56, 55, 97, 64, 0, 64, 0, 145, 0, 0, 0, 0, 0, 134, 195, 81, 255, 255, 255, 0, 0, 0, 33, 249, 4, 9, 0, 0, 3, 0, 33, 255, 11, 73, 67, 67, 82, 71, 66, 71, 49, 48, 49, 50, 255, 0, 0, ...>>
iex(2)> MagicNumber.detect(content)
{:ok, {:image, :gif}}
```

## Supported files

- image/jpeg
- image/png
- image/gif
- image/tiff
- application/pdf

## License

MIT
