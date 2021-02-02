# frozen_string_literal: true

class CitiesController < ApplicationController
  def index
  end

  def show
  end

  def search
    if params[:search].blank?
      @cities = City.all
    else
      @cities = City.search(params)
    end
  end
end
