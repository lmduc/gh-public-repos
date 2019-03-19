class HomesController < ApplicationController
  def index
    redirect_to public_repositories_path
  end
end
