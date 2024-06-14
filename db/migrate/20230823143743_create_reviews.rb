# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :user
      t.integer :stars, default: 0, limit: 1
      t.string :review
      t.belongs_to :movie, index: true, foreign_key: true

      t.timestamps
    end
  end
end
