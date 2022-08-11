defmodule CSVParserWeb.PageController do
  use CSVParserWeb, :controller
  
  alias CSVParser.{
    Parser
  }

  def index(conn, params) do
    case params do
      %{} ->
        render(conn, "index.html")
      non_empty_params ->
          non_empty_params
          |> Map.get("path")
          |> Enum.at(-1)
        render(conn, "index.html")
    end
  end
    
  def process_csv(conn, %{ "file" => file, "strategy" => strategy}) do
    json(conn, Parser.process_csv(file, strategy))
  end
end
