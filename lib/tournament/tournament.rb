class Game
  def initialize(input)
    @points = Hash.new(0)
    @wins = Hash.new(0)
    @draws = Hash.new(0)
    @loses = Hash.new(0)

    input.split("\n").each(&method(:process_game))
  end

  def print_table
    # sort it, alphabeticaly and by points
    rows =
      @points.sort_by { |k, v| [-v.to_i, k] }
             .map { |item| print_row(item[0]) }
             .join

    "#{print_header}#{rows unless rows.nil?}"
  end

  private

  def print_header
    <<~TABLE
      #{format_name('Team')} | MP |  W |  D |  L |  P
    TABLE
  end

  def print_row(team)
    <<~TABLE
      #{format_name(team)} |  #{@wins[team] + @loses[team] + @draws[team]} |  #{@wins[team]} |  #{@draws[team]} |  #{@loses[team]} |  #{@points[team]}
    TABLE
  end

  def format_name(name)
    name.to_s + (' ' * (30 - name.length))
  end

  def process_game(game)
    a, b, result = game.split(';')

    case result
    when 'win'
      @points[a] += 3
      @points[b] += 0
      @wins[a] += 1
      @loses[b] += 1
    when 'draw'
      @points[a] += 1
      @points[b] += 1
      @draws[a] += 1
      @draws[b] += 1
    else
      @loses[a] += 1
      @wins[b] += 1
      @points[b] += 3
      @points[a] += 0
    end
  end
end

class Tournament
  def instance_method; end

  def self.tally(input)
    ::Game.new(input).print_table
  end
end
