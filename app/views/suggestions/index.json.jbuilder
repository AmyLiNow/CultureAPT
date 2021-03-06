json.array!(@suggestions) do |suggestion|
  json.extract! suggestion, :id, :org_name, :org_id, :venue_id, :event_name, :start_date, :end_date, :start_time, :end_time, :description, :event_url, :spec_instruction, :ticket_rsvp_instruction, :price_low, :price_high, :restriction, :category, :subcategory, :venue_name, :street, :city, :state, :zip, :venue_url, :phone, :latitude, :longitude
  json.url suggestion_url(suggestion, format: :json)
end
