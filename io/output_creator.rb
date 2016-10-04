module OutputCreator

  # @param [Array] result
  # @param [String] output_filename
  def self.write_result(result, output_filename)
    File.open(output_filename, 'w') do |file|
      header = "#{'mine'.ljust(21, ' ')} | "\
               "explosions | "\
               "duration | "\
               "rank  | "\
               "details by steps\n"
      file.write header

      result.each do |r|
        row = "#{r[0].to_s.ljust(21, ' ')} | "\
              "#{r[1][:exploded_mines].to_s.ljust(10, ' ')} | "\
              "#{r[1][:duration].to_s.ljust(8, ' ')} | "\
              "#{r[1][:rank].round(3).to_s.ljust(5, ' ')} | "\
              "#{r[1][:details].join(', ')}\n"
        file.write row
      end
    end
    puts "Done! Now you can look at your results in '#{output_filename}'"
  end

end
