require "rails_helper"

RSpec.describe SedimentsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/sediments").to route_to("sediments#index")
    end

    it "routes to #new" do
      expect(:get => "/sediments/new").to route_to("sediments#new")
    end

    it "routes to #show" do
      expect(:get => "/sediments/1").to route_to("sediments#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/sediments/1/edit").to route_to("sediments#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/sediments").to route_to("sediments#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/sediments/1").to route_to("sediments#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/sediments/1").to route_to("sediments#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/sediments/1").to route_to("sediments#destroy", :id => "1")
    end

  end
end
