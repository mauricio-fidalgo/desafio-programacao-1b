require 'rails_helper'

RSpec.describe SoldProductsFile do
  let!(:example_file) do
    File.open(
      Rails.root.join( 'spec', 'fixtures', 'dados.txt'),
'r'
    )
  end

  let(:sold_products_file) { SoldProductsFile.new example_file }
  
  describe '#initialize' do
    it 'should assign the first argument to @file' do
      example = SoldProductsFile.new(example_file)
      expect(example.instance_variable_get(:@file)).to be example_file
    end
  end

  
  describe '#each_entry' do
    it 'should call a block on sold product on the file.' do
      expect{ |e| sold_products_file.each_entry(&e) }.to yield_control.exactly(4).times
    end
  end

  describe '.parse_line' do
    it 'should return a hash from a tabulated string' do
      example = ['Buyer', 'example product', '100.5', '2', 'Jhonny Test St.', 'the best Provider']
      
      expected = {
        buyer_name: example[0],
        description: example[1],
        price: example[2],
        quantity: example[3],
        address: example[4],
        provider_name: example[5]
      }

      expect(SoldProductsFile.parse_line(example.join("\t"))).to eq expected
    end
  end
end
