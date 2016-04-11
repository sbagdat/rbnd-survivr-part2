class Contestant
  attr_reader :name

  def initialize(name)
    @name = name.light_blue
  end

  def to_s
    @name
  end
end
