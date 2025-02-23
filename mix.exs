defmodule Html2Markdown.MixProject do
  use Mix.Project

  def project do
    [
      app: :html2markdown,
      version: "0.1.2",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      aliases: aliases(),
      test_coverage: [tool: ExCoveralls],
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:floki, ">= 0.36.2"},

      # Dev & Test
      {:ex_doc, "~> 0.31.1", only: :dev, runtime: false},
      {:sobelow, "~> 0.12", only: [:dev, :test], runtime: false},
      {:credo, "~> 1.7.3", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.10", only: [:dev, :test], runtime: false},
      {:rambo, "~> 0.3.4", only: [:dev, :test], runtime: false}
    ]
  end

  defp description() do
    "Extract the content from an HTML document to Markdown (removing non-content sections and tags)"
  end

  defp package() do
    [
      files: ~w(lib test .formatter.exs mix.exs README* LICENSE*),
      maintainers: ["Chase Pursley"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/cpursley/html2markdown"}
    ]
  end

  defp aliases() do
    [
      # Run tests and check coverage
      test: ["test", "coveralls"],
      # Run to check the quality of your code
      quality: [
        "format --check-formatted",
        "sobelow --config",
        "credo --only warning"
      ]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]
end
