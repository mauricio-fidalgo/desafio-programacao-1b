require 'rails_helper'

RSpec.describe SoldProductsController, type: :controller do
  
  describe 'GET #index' do
    subject(:get_index) { get :index }
    it 'should render without errors' do
      expect(get_index).to be_success 
    end
  end

end
