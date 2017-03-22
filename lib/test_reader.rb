class TestReader
  def initialize(file_name)
    @file_path = "#{File.dirname(__FILE__)}/../#{file_name}"
  end

  def to_array
    File.readlines(@file_path, encoding: 'UTF-8')
  end
end
