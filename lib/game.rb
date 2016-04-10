class Game
  attr_accessor :tribes

  def initialize(tribe_one, tribe_two)
    @tribes = [tribe_one, tribe_two]
  end

  def add_tribe(tribe)
    @tribes << tribe
  end

  def immunity_challenge
    @tribes.sample
  end

  def clear_tribes
    @tribes.clear
  end

  def merge(new_tribe_name)
    merged_members = []
    @tribes.each do |tribe|
      merged_members << tribe.members
    end
    merged_tribe = Tribe.new(name: new_tribe_name, members: merged_members.flatten)
    clear_tribes
    @tribes << merged_tribe
    merged_tribe
  end

  def individual_immunity_challenge
    @tribes.sample.members.sample
  end
end
