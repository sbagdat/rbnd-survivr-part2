class Tribe
  attr_reader :name, :members

  def initialize(options = {})
    @name = options[:name]
    @members = options[:members]
    puts "Tribe has been created."
  end

  def to_s
    @name
  end

  def tribal_council(options = {})
    member = @members.pop
    member if options[:immune] != member
  end
end
