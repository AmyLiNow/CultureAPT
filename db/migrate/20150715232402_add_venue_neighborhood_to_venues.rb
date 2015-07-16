class AddVenueNeighborhoodToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :venue_neighborhood, :string
  end
end
