class EntriesController < ApplicationController
  def index
    @entries = Entry.periscope(params[:search])
  end
end
