require './io/input_reader.rb'
require './io/output_creator.rb'
require './models/mine.rb'
require './models/minefield.rb'

module Main

  class << self

    # @param [String] input_filename
    # @param [String] output_filename
    def run(input_filename, output_filename)
      input_filename ||= 'input.txt'
      output_filename ||= 'output.txt'

      mines = InputReader.read_data(input_filename)
      return unless mines
      puts 'Calculating...'

      minefield = Minefield.new mines
      minefield.calculate

      OutputCreator.write_result minefield.sort_by_rank, output_filename
    end

  end
end

if ARGV[0] == '--help'
  puts File.open('usage/info.txt', 'r').read
else
  Main.run(ARGV[0], ARGV[1])
end
