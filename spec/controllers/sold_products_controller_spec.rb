require 'rails_helper'

RSpec.describe SoldProductsController, type: :controller do
  
  describe 'GET #index' do
    subject(:get_index) { get :index }

    it 'should render without errors' do
      expect(get_index).to be_success 
    end

    it 'should have @sold_products assigned' do
      get_index
      expect(assigns(:sold_products)).to_not be_nil
    end
  end

  describe 'POST #create' do
    let!(:fake_file) { fixture_file_upload 'dados.txt' }

    subject(:post_create) { post :create, { sold_products_file: fake_file } }
    
    it 'should call SoldProduct import' do
      expect(SoldProduct).to receive(:import)
      post_create
    end

    context 'user sends a valid file' do
      it 'should create products' do
        expect { post_create }.to change{SoldProduct.count}.by 4
      end

      it 'should have a flash message assigned' do
        post_create
        expect(flash[:message]).to be_present
      end
    end

    context 'user sends a invalid file' do
      let!(:fake_file) { nil }

      it 'should not create any product' do
        expect { post_create }.to_not change{SoldProduct.count}
      end

      it 'should have a error message assigned' do
        post_create
        expect(flash[:error]).to be_present
      end
    end
  end

end
