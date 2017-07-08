module Direction
  def N dir
    dir == 'R' ? 'E' : 'W'
  end

  def S dir
    dir == 'R' ? 'W' : 'E'
  end

  def W dir
    dir == 'R' ? 'N' : 'S'
  end

  def E dir
    dir == 'R' ? 'S' : 'N'
  end
end

