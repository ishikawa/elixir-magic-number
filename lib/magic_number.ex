defmodule MagicNumber do
  @moduledoc """
  The module to determine a file's type from its
  [magic number](https://en.wikipedia.org/wiki/File_format#Magic_number).
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
  # GIF
  def detect("GIF87a" <> _), do: {:ok, {:image, :gif}}
  def detect("GIF89a" <> _), do: {:ok, {:image, :gif}}

  # JPEG
  def detect(<<0xff, 0xd8, 0xff, _ :: binary>>), do: {:ok, {:image, :jpeg}}

  # PNG
  def detect(<<0x89, 0x50, 0x4e, 0x47, 0x0d, 0x0a, 0x1a, 0x0a, _ :: binary>>),
    do: {:ok, {:image, :png}}

  # TIFF
  def detect("II*\0" <> _), do: {:ok, {:image, :tiff}}
  def detect("MM\0*" <> _), do: {:ok, {:image, :tiff}}

  # PDF
  def detect("%PDF" <> _), do: {:ok, {:application, :pdf}}

  # error
  def detect(_), do: :error

end
