class SoldProductsFile
  INDEX_TO_COLUMN = {
    0 => :buyer_name,
    1 => :description,
    2 => :price,
    3 => :quantity,
    4 => :address,
    5 => :provider_name
  }

  def initialize file
    @file = file
  end

  def each_entry &block
    @file.rewind
    @file.each_line do |line|
      next if @file.lineno == 1
      block.(SoldProductsFile.parse_line(line))
    end
  end

  def self.parse_line line
    result = {}
    line.split("\t").each.with_index do |value, index|
      result[INDEX_TO_COLUMN[index]] = value.strip
    end
    result
  end
end
