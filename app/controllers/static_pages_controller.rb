class StaticPagesController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:index, :home]
  
  def index
    
  end
  
  def home
    
  end
end
