class PagesController < ApplicationController
  skip_before_filter :authorize, :only => [:home, :welcome]

  def home
  end
  
  def about
  end

  def contact
  end

  def welcome
  end
end
