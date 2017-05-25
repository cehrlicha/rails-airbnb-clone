class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @friends = Friend.all
  end

  def result

    if !params.nil? && !params.empty?

      @friends = Friend.search(params)
    end
  end
end
