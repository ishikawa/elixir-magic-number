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

## Usage

```elixir
% iex -S mix
Erlang/OTP 18 [erts-7.2.1] [source] [64-bit] [smp:4:4] [async-threads:10] [hipe] [kernel-poll:false] [dtrace]

Interactive Elixir (1.2.0) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> content = File.read!("sample.gif")
<<71, 73, 70, 56, 55, 97, 64, 0, 64, 0, 145, 0, 0, 0, 0, 0, 134, 195, 81, 255, 255, 255, 0, 0, 0, 33, 249, 4, 9, 0, 0, 3, 0, 33, 255, 11, 73, 67, 67, 82, 71, 66, 71, 49, 48, 49, 50, 255, 0, 0, ...>>
iex(2)> MagicNumber.detect(content)
{:ok, {:image, :gif}}
```

## Supported files

- image/jpeg
- image/png
- image/gif
