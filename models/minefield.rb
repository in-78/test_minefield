class Minefield

  attr_reader :result

  def initialize(mines)
    @mines = mines
    @result = {}
  end

  def calculate
    @mines.each do |mine|
      reset
      explode([mine])
      result[mine.to_s] = result_data(@mine_result)
    end
  end

  # @return [Array]
  def sort_by_rank
    result.sort_by{ |_, v| [-v[:rank], -v[:exploded_mines], -v[:details][0].to_i] }
  end

  private

  def reset
    @mine_result = []
    @unexploded_mines = @mines.dup
  end

  # @param [Array<Mine>] mines
  def explode(current_mines)
    return if current_mines.empty?
    mine_count = 0
    mines_for_next_step = []

    @unexploded_mines -= current_mines
    @unexploded_mines.each do |unexploded_mine|
      if unexploded_mine.explodable?(current_mines)
        mine_count += 1
        mines_for_next_step << unexploded_mine
      end
    end

    if mine_count.nonzero?
      @mine_result << mine_count
    end

    explode(mines_for_next_step)
  end

  # @param [Array] mine_result
  # @return [Hash]
  def result_data(mine_result)
    result = {
      exploded_mines: mine_result.inject(:+) || 0,
      duration: mine_result.length,
      details: mine_result
    }
    result[:rank] = rank(result[:exploded_mines], result[:duration])
    result
  end

  # @param [Integer/Float] exploded_mines
  # @param [Integer/Float] duration
  # @return [Float]
  def rank(exploded_mines, duration)
    rank = exploded_mines.to_f / duration
    rank = 0 if rank.nan?
    rank
  end
end
