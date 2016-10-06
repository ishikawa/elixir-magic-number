defmodule MagicNumber do
  @moduledoc """
  The module to determine a file's type from its
  [magic number](https://en.wikipedia.org/wiki/File_format#Magic_number).
  """

  @typedoc """
  A media type is a two-part identifier for file format. For example:

  ```elixir
  {:application, :zip} # application/zip
  {:image, :png}       # image/png
  ```

  See [IANA list of official media types](https://www.iana.org/assignments/media-types/media-types.xhtml).
  """
  @type media_type :: {atom, atom}

  # Rules :: [{media_type, [binary]}]
  @rules [
    # image
    {{:image, :gif},  ["GIF87a", "GIF89a"]},
    {{:image, :jpeg}, [<<0xff, 0xd8, 0xff>>]},
    {{:image, :png},  [<<0x89, 0x50, 0x4e, 0x47, 0x0d, 0x0a, 0x1a, 0x0a>>]},
    {{:image, :tiff},  ["II*\0", "MM\0*"]},

    # application
    {{:application, :pdf},  ["%PDF"]},
    {{:application, :zip},  [
      <<0x50, 0x4b, 0x03, 0x04>>,
      <<0x50, 0x4b, 0x05, 0x06>>,
      <<0x50, 0x4b, 0x07, 0x08>>,
    ]},
    {{:application, :gzip},  [<<0x1f, 0x8b>>]},
  ]

  @doc """
  Determine media type from its contents.

  ## Examples

      iex> MagicNumber.detect("GIF89a...")
      {:ok, {:image, :gif}}
      iex> MagicNumber.detect(<<>>)
      :error

  """
  @spec detect(binary) :: {:ok, media_type} | :error

  for {media_type, headers} <- @rules, magic <- headers do
    def detect(unquote(magic) <> _), do: {:ok, unquote(media_type)}
  end

  # error
  def detect(_), do: :error

end
