require_relative 'colorizr'
require_relative "game"
require_relative "tribe"
require_relative "contestant"
require_relative "jury"

#After your tests pass, uncomment this code below
#=========================================================
# # Create an array of twenty hopefuls to compete on the island of Borneo
@contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
@contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!
#
# # Create two new tribes with names
@coyopa = Tribe.new(name: "Pagong", members: @contestants.shift(10))
@hunapu = Tribe.new(name: "Tagi", members: @contestants.shift(10))
#
# # Create a new game of Survivor
@borneo = Game.new(@coyopa, @hunapu)
#=========================================================


#This is where you will write your code for the three phases
def phase_one
  puts "***PHASE ONE***".green
  8.times do
    eliminated = @borneo.tribes[(@borneo.immunity_challenge == @borneo.tribes.first) ? 0 : 1].tribal_council
    puts "Eliminated contestant of this turn is #{eliminated}."
  end
end

def phase_two
  puts "***PHASE TWO***".green
  3.times do
    eliminated = @borneo.tribes[0].tribal_council(immune: @borneo.individual_immunity_challenge)
    puts "Eliminated contestant of this turn is #{eliminated}."
  end
end

def phase_three
  puts "***PHASE THREE***".green
  7.times do
    eliminated = @borneo.tribes[0].tribal_council(immune: @borneo.individual_immunity_challenge)
    @jury.add_member(eliminated)
    puts "#{eliminated} is eliminated and became a jury now."
  end
end


# If all the tests pass, the code below should run the entire simulation!!
#=========================================================
phase_one #8 eliminations
@merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
phase_two #3 more eliminations
@jury = Jury.new
phase_three #7 eliminiations become jury members
finalists = @merge_tribe.members #set finalists
vote_results = @jury.cast_votes(finalists) #Jury members report votes
@jury.report_votes(vote_results) #Jury announces their votes
@jury.announce_winner(vote_results) #Jury announces final winner
