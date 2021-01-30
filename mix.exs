defmodule MagicNumber.Mixfile do
  use Mix.Project

  def project do
    [
      app: :magic_number,
      version: "0.0.5",
      elixir: "~> 1.2",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      description: "MagicNumber is the module to determine a file's type from its magic number.",
      package: package(),
      deps: deps(),
      source_url: "https://github.com/ishikawa/elixir-magic-number",
      docs: [extras: ["README.md"]]
    ]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.23", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      maintainers: ["Takanori Ishikawa"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/ishikawa/elixir-magic-number"
      }
    ]
  end
end
