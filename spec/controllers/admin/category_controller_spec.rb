require 'spec_helper'

describe Admin::CategoriesController, type: :controller do
  
  render_views

  before(:each) do
    Factory(:blog)
    #TODO Delete after removing fixtures
    Profile.delete_all
    henri = Factory(:user, :login => 'henri', :profile => Factory(:profile_admin, :label => Profile::ADMIN))
    request.session = { :user => henri.id }
  end
  
  describe "#new" do
    context "When create a category" do
      it "should get success to enter the new page" do
        get :new
        expect(response).to render_template(:new)
      end
      
      it "should get success to enter the new page" do
        
        post :new, { :category => {"name" => 'Movie',
                                   "permalink" => 'movie',
                                   "keywords" => 'comedy, action, romance, thriller, animation, sci-fi',
                                   "descripton" => 'This categorie includes articles that are related to movies.'} }
        assert_response :redirect, :action => 'new'
      end
    end
  end
end