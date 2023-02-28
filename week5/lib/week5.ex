import Enum

defmodule Week5 do

  require HTTPoison
  require Floki

  def getQuotes() do
    case HTTPoison.get("https://quotes.toscrape.com/") do
      {:ok, %HTTPoison.Response{body: body}} ->
        Floki.find(body, "div.quote")
        |> map(&parseQuote/1)
      {:error, reason} ->
        IO.puts "Fetch failed: #{inspect(reason)}"
        []
    end

  end

  defp parseQuote(div) do
    %{
      author: div |> Floki.find("small.author") |> Floki.text(),
      quote: div |> Floki.find("span.text") |> Floki.text(),
      tags: div |> Floki.find("div.tags a.tag") |> map(&Floki.text/1)
    }
  end

  def quotesToJson() do
    case File.write("quotes.json", Jason.encode!(getQuotes())) do
      :ok -> IO.puts "Find your quotes here: quotes.json"
      {:error, reason} -> IO.puts("Failed to write quotes: #{inspect(reason)}")
    end
  end

end

# Week5.getQuotes()
# Week5.quotesToJson()
