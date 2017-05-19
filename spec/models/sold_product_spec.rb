require 'rails_helper'

RSpec.describe SoldProduct, type: :model do
  describe '.import' do
    let(:sold_product_file) do
      double('SoldProductFile')
    end

    subject { SoldProduct.import(sold_product_file) }

    context 'all the entries are valid' do
      before do
        allow(sold_product_file).to receive(:each_entry) { |&b| 5.times{ b.({}) } }
      end

      it 'should create 5 SoldProducts' do
        expect{subject}.to change{SoldProduct.count}.by(5)
      end

      it 'should return true' do
        expect(subject).to be true
      end
    end

    context 'one of the entries is invalid' do
      before do
        allow(sold_product_file).to receive(:each_entry) do |&b| 
          3.times{ b.({}) }
          raise 'random exception'
          2.times{ b.({}) }
        end
      end

      it 'should not import any entry' do
        expect{subject}.to_not change{SoldProduct.count}
      end

      it 'should return false' do
        expect(subject).to be false
      end
    end
  end

  describe '#total' do
    let(:example) { SoldProduct.new({price: 100.0, quantity: 5}) }
    it 'should be equals the quantity times the price' do
      expect(example.total).to eq 500.0
    end
  end
end
