class WelcomeController < ApplicationController
  def index
    # @issues  = [ { title: "Ruby lovers", comments: "4" }, { title: "Rails and Laravel", comments: "5" } ]
    @issues = Issue.all
  end

  def welcome
    # @issues  = [ { title: "Ruby lovers", comments: "4" }, { title: "Rails and Laravel", comments: "5" } ]
  end
end
