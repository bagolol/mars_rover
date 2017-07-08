class Parser
  def initialize(file)
    @file = file
  end

  def read_file
    File.readlines(@file).map {|line| line}
  end
end
