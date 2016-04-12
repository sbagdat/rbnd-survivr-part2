class Tribe
  attr_reader :name, :members

  def initialize(options = {})
    @name = options[:name].red
    @members = options[:members]
    print_tribe
  end

  def to_s
    @name
  end

  def tribal_council(options = {})
    @members.delete(@members.reject {|m| options[:immune] && m == options[:immune] }.sample)
  end

  def print_tribe
    puts "#{@name.upcase.red} tribe created"
    @members.each_with_index {|member, i| puts "#{i+1}- #{member}"}
  end
end
