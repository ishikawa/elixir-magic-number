# MagicNumber

[![CI Status](https://travis-ci.org/ishikawa/elixir-magic-number.svg?branch=master)](https://travis-ci.org/ishikawa/elixir-magic-number?branch=master) [![Hex.pm](https://img.shields.io/hexpm/v/magic_number.svg)](https://hex.pm/packages/magic_number)
[![Hexdocs.pm](https://img.shields.io/badge/docs-html-blue.svg)](https://hexdocs.pm/magic_number/0.0.4)

MagicNumber is the module to determine a file's type from its [magic number](https://en.wikipedia.org/wiki/File_format#Magic_number).

**It is currently heavily under development**, The public API should not be considered stable.

## Installation

The package can be installed from [Hex](https://hex.pm/) as:

Add magic_number to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:magic_number, "~> 0.0.4"}]
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

## Supported file types

- image/jpeg
- image/png
- image/gif
- image/tiff
- application/pdf
- application/zip
- application/gzip
- application/x-msdownload(exe)
- application/x-apple-diskimage(dmg)

## License

MIT
