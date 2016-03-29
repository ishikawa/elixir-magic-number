defmodule MagicNumberTest do
  use ExUnit.Case
  doctest MagicNumber

  # Path to fixtures directory which contains sample files.
  @fixtures_dir Path.join(__DIR__, "fixtures")

  test "MagicNumber.detect" do
    content = @fixtures_dir
              |> Path.join("000.gif")
              |> File.read!

    assert MagicNumber.detect(content) == {:ok, {:image, :gif}}
  end
end
