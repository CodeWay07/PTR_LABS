import Enum

defmodule Week5 do

  require HTTPoison
  require Floki

  def getQuotes() do
    case HTTPoison.get("https://quotes.toscrape.com/") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        Floki.find(body, "div.quote")
        |> map(&parseQuote/1)
      {:ok, %HTTPoison.Response{status_code: 404}} ->
          IO.puts ("Not found :(")
      {:error, %HTTPoison.Error{reason: reason}} ->
          IO.inspect reason
    end
  end

  def parseQuote(div) do
    %{
      author: div |> Floki.find("small.author") |> Floki.text(),
      quote: div |> Floki.find("span.text") |> Floki.text(),
      tags: div |> Floki.find("div.tags a.tag") |> map(&Floki.text/1)
    }
  end

  def quotesToJson() do
     File.write("quotes.json", Jason.encode!(getQuotes()))
     IO.puts("Check the quotes.json file")
  end

end

# Week5.getQuotes()
# Week5.quotesToJson()
