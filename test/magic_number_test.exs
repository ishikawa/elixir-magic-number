defmodule MagicNumberTest.Helpers do
  defmacro assert_detect_file(filename, expected_media_type) do
    quote do
      content =
        @fixtures_dir
        |> Path.join(unquote(filename))
        |> File.read!()

      assert MagicNumber.detect(content) == {:ok, unquote(expected_media_type)}
    end
  end
end

defmodule MagicNumberTest do
  use ExUnit.Case
  doctest MagicNumber

  import MagicNumberTest.Helpers

  # Path to fixtures directory which contains sample files.
  @fixtures_dir Path.join(__DIR__, "fixtures")

  test "MagicNumber.detect" do
    assert_detect_file("000.jpg", {:image, :jpeg})
    assert_detect_file("000.gif", {:image, :gif})
    assert_detect_file("000.png", {:image, :png})
    assert_detect_file("000.tiff", {:image, :tiff})
    assert_detect_file("000.pdf", {:application, :pdf})
    assert_detect_file("000.zip", {:application, :zip})
    assert_detect_file("000.gz", {:application, :gzip})
    assert_detect_file("000.exe", {:application, :exe})
    assert_detect_file("000.dmg", {:application, :dmg})
  end
end
