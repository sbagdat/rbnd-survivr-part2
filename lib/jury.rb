class Jury
  attr_accessor  :members

  def initialize
    @members = []
  end

  def add_member(member)
    @members << member
  end

  def cast_votes(finalists)
    votes = {}
    @members.each do |member|
      the_choosen_one = finalists.sample
      votes[the_choosen_one] ? votes[the_choosen_one] += 1 : votes[the_choosen_one] = 1
      puts "#{member} has been voted for #{the_choosen_one.name}!"
    end

    return votes
  end

  def report_votes(finalists)
    finalists.each do |finalist, votes_count|
      puts "#{finalist}: #{votes_count}"
    end
  end

  def announce_winner(final_votes)
    winner = final_votes.max_by{|key, value| final_votes[key]}[0]
    puts "THE CHAMPION IS #{winner.name.upcase}"
    winner
  end
end
