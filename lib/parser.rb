# Parser injests the input file
# and returns the lines stored in an array
class Parser
  def initialize(file)
    @file = file
  end

  def read_file
    File.readlines(@file).map { |line| line }
  end
end
