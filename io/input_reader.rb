module InputReader

  class << self

    # @param [String] input_filename
    # @return [Array<Mine>/false]
    def read_data(input_filename)
      unless File.exist?(input_filename)
        puts "Input file '#{input_filename}' doesn't exist"
        return false
      end
      puts "Reading data from '#{input_filename}'..."

      mines = []
      lines_count = 0
      File.readlines(input_filename).each do |line|
        lines_count += 1
        data = line.split(' ')
        begin
          data = data.map{ |x| Float(x) }
        rescue ArgumentError
          readline_error(line, 'has incorrect data format')
          next
        end
        if data.length != 3
          readline_error(line, 'has incorrect count of numbers')
          next
        end
        mines << Mine.new(*data)
      end

      if mines.length.zero?
        puts "Input file '#{input_filename}' has no correct data. Exiting..."
        return false
      else
        puts "Successfully read #{mines.length} of #{lines_count} lines"
      end

      mines
    end

    private

    # @param [String] line
    # @param [String] message
    def readline_error(line, message)
      puts "Corrupted line: '#{line.gsub("\n", '')}' #{message}"
      puts "Line must contains 3 integer or float numbers separated by spaces"
    end
  end
end
