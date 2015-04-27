class Die

  def initialize(sides = 6)
    @sides = sides
  end

  def roll
    1 + rand(@sides)
  end
end