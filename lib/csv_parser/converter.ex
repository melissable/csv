defmodule CSVParser.Converter do
  require Logger
  import Ecto.Query, warn: false

  def site_url do
    raw_url = CSVParserWeb.Endpoint.url()

    url_segments =
      raw_url
      |> String.split(":")

    case length(url_segments) do
      2 -> Enum.at(url_segments, 0)
      3 -> Enum.at(url_segments, 0) <> ":" <> Enum.at(url_segments, 1)
      # something else we didn't anticipate
      _ -> raw_url
    end
  end

  def force_int(nil), do: nil
  def force_int(""), do: nil
  def force_int(v) when is_binary(v), do: String.to_integer(v)
  def force_int(v), do: v

  def string_keys_to_atoms(list) do
    Enum.map(list, fn row ->
      Map.new(row, fn kv = {k, v} ->
        if is_binary(k) do
          {String.to_atom(k), v}
        else
          kv
        end
      end)
    end)
  end

  # CSV example
  # def request_list_to_csv(list_of_maps, timezone) do
  #   header_row = ~w(created_at request_id requested_delivery_date created_by_user_full_name status_name
  #   origin destination trailer_unit_number trailer_content in_blue_bin_count in_pallet_count
  #   in_gaylord_count out_blue_bin_count out_pallet_count out_gaylord_count out_large_item_count percent_full number_of_donations
  #   donation_description)
  #   list_of_maps
  #   |> Enum.map(fn r -> [
  #       to_display_format(r.inserted_at, timezone),
  #       r.id,
  #       to_date_display_format(r.requested_delivery_on),
  #       "#{r.user.first_name} #{r.user.last_name}",
  #       r.status.name,
  #       (if(is_nil(r.from_location), do: "", else: r.from_location.name)), 
  #       (if(is_nil(r.to_location), do: "", else: r.to_location.name)),
  #       (if(is_nil(r.trailer), do: "", else: r.trailer.unit_number)),
  #       (if(is_nil(r.required_content_type), do: "", else: r.required_content_type.name)),
  #       (if(is_nil(r.in_blue_bin_count), do: "", else: r.in_blue_bin_count)),
  #       (if(is_nil(r.in_pallet_count), do: "", else: r.in_pallet_count)),
  #       (if(is_nil(r.in_gaylord_count), do: "", else: r.in_gaylord_count)),
  #       (if(is_nil(r.out_blue_bin_count), do: "", else: r.out_blue_bin_count)),
  #       (if(is_nil(r.out_pallet_count), do: "", else: r.out_pallet_count)),
  #       (if(is_nil(r.out_gaylord_count), do: "", else: r.out_gaylord_count)),
  #       (if(is_nil(r.out_large_item_count), do: "", else: r.out_large_item_count)),
  #       (if(is_nil(r.percent_full), do: "", else: r.percent_full)),
  #       (if(is_nil(r.number_of_donations), do: "", else: r.number_of_donations)),
  #       (if(is_nil(r.donation_description), do: "", else: r.donation_description))
  #     ] end)
  #   # add a header row
  #   |> (fn data_list_of_list -> [header_row | data_list_of_list] end).()
  #   |> CSVParser.dump_to_iodata()
  #   |> :unicode.characters_to_binary(:utf8, {:utf16, :little})
  # end

  def to_x_or_blank(nil), do: nil
  def to_x_or_blank(b) when is_boolean(b), do: if(b, do: "X", else: "")
end
