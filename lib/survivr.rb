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
  puts "Phase One"
  eliminated_contestants = []
  8.times do
    loser_tribe_order = 1
    loser_tribe_order = 0 if @borneo.immunity_challenge == @borneo.tribes.first
    losers = @borneo.tribes[loser_tribe_order].members
    immune = @borneo.individual_immunity_challenge
    eliminated = @borneo.tribes[loser_tribe_order].tribal_council(immune: immune)
    @borneo.tribes[loser_tribe_order].members.delete(eliminated)
    eliminated_contestants << eliminated
    @borneo.tribes[loser_tribe_order].members.delete(eliminated)
    puts "Loser tribe of this turn is #{@borneo.tribes[loser_tribe_order].name} and eliminated contestant is #{eliminated}."
  end
end

def phase_two
  puts "Phase Two"
  3.times do
    immune = @borneo.individual_immunity_challenge
    eliminated = @borneo.tribes.first.tribal_council(immune: immune)
    @borneo.tribes.first.members.delete(eliminated)
    puts "Eliminated contestant of this turn is #{eliminated}."
  end
end

def phase_three
  puts "Phase Three"
  7.times do
    immune = @borneo.individual_immunity_challenge
    eliminated = @borneo.tribes.first.tribal_council(immune: immune)
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
