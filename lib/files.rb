class Files
  attr_reader :file, :desc

  def initialize(file_path)
    @file = file_path
    @desc = line_index
  end

  def line
    opened_file = File.open(file)
    file_lines = opened_file.readlines.map(&:chomp)
    opened_file.close
    file_lines
  end

  def line_data
    lines_data = []
    File.foreach(file) do |line|
      line_data = line.split
      lines_data.push(line_data)
    end
    lines_data
  end

  def line_index
    lines = line
    hash = {}

    lines.each_with_index do |line, id|
      hash[id] = line
    end
    hash
  end

  def line_lenght(line)
    line_arr = line.split('')
    count = 0
    line_arr.each do |ele|
        ele.split('').each do |char|
            count += 1
        end
    end
    count
  end
end

# fi = Files.new('lib/code.rb')
# line = fi.desc[1]
# puts fi.line_lenght(line)
# result = fi.line_data
# puts result.inspect
# res = fi.line
# puts res.inspect