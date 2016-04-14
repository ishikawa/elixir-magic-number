defmodule MagicNumber.Mixfile do
  use Mix.Project

  def project do
    [app: :magic_number,
     version: "0.0.3",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: "MagicNumber is the module to determine a file's type from its magic number.",
     package: package,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:earmark, "~> 0.2.1", only: :dev},
      {:ex_doc, "~> 0.11.4", only: :dev},
    ]
  end

  defp package do
    [
      maintainers: ["Takanori Ishikawa"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/ishikawa/elixir-magic-number",
      },
    ]
  end
end
