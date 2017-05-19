class SoldProduct < ActiveRecord::Base
  def self.import sold_product_file
    begin
      transaction do
        sold_product_file.each_entry { |entry| create(entry) }
      end
      return true
    rescue => e
      return false
    end
  end

  def total
    price * quantity
  end
end
