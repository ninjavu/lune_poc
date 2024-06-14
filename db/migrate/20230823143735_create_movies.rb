# frozen_string_literal: true

class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :movie
      t.string :description
      t.integer :year, limit: 2
      t.string :director
      t.string :actor
      t.string :filming_location
      t.string :country

      t.timestamps
    end

    add_index :movies, :movie, unique: true
  end
end
