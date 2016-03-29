defmodule MagicNumber do
  @moduledoc """
  The module to determine a file's type from its
  [magic number](https://en.wikipedia.org/wiki/Magic_number_(programming)#Magic_numbers_in_files).
  """

  @typedoc """
  A media type is a two-part identifier for file format.

      application/zip
      image/png

  - [IANA list of official media types](https://www.iana.org/assignments/media-types/media-types.xhtml)
  """
  @type media_type :: {atom, atom}

  @doc """
  Determine media type from its contents.

  ## Examples

      iex> MagicNumber.detect("GIF89a...")
      {:ok, {:image, :gif}}
      iex> MagicNumber.detect(<<>>)
      :error

  """
  @spec detect(binary) :: {:ok, media_type} | :error
  def detect("GIF87a" <> _), do: {:ok, {:image, :gif}}
  def detect("GIF89a" <> _), do: {:ok, {:image, :gif}}
  def detect(_), do: :error

end
