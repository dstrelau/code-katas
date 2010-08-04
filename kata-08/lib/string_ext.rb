class String
  def firstc(num)
    self[0,num]
  end

  def lastc(num)
    self[-num, self.size]
  end
end
