# frozen_string_literal: true

class City < ApplicationRecord
  belongs_to :state

  def self.search(params)
    cities = City.where('lower(name) LIKE lower(?)', "%#{params[:search]}%")
  end
end
