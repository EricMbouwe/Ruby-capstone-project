class Files
  attr_reader :file, :desc

  def initialize(file_path)
    @file = file_path
    @desc = lines_with_index
  end

  def get_lines
    opened_file = File.open(file)
    file_lines = opened_file.readlines.map(&:chomp)
    opened_file.close
    file_lines
  end

  def lines_data
    lines_data = []
    File.foreach(file) do |line|
      line_data = line.split
      lines_data.push(line_data)
    end
    lines_data
  end

  def one_line_data_chars(line)
    line_data = []
    line_arr = line.split('')
    line_arr.each do |ele|
      ele.split('').each do |char|
        line_data.push(char)
      end
    end
    line_data
  end

  def one_line_data_words(line)
    line_data = line.split
    line_data
  end

  def lines_with_index
    lines = get_lines
    hash = {}
    lines.each_with_index do |line, id|
      hash[id] = line
    end
    hash
  end

  def line_length(line)
    line_arr = line.split('')
    count = 0
    line_arr.each do |ele|
      ele.split('').each do
        count += 1
      end
    end
    count
  end
end

# fi = Files.new('lib/code.rb')
# line = fi.desc[1]
# puts fi.one_line_data_word(line).inspect
# puts fi.one_line_data_char(line).inspect
# result = fi.line_data
# puts result.inspect
# res = fi.line
# puts res.inspect