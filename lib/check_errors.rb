require_relative '../lib/errors.rb'
require_relative '../lib/file.rb'
require 'colorize'

class CheckErrors < Errors
  include ErrorMethods

  attr_accessor :messages

  def initialize(file_path)
    super(file_path)
    @messages = []
  end

  def check_all
    desc.each_with_index do |line, id|
      line = desc[id]
      check_max_line_length(line, id)
      check_no_single_line_methods(line, id)
      check_spaces_parenthesis(line, id)
      check_spaces_braces(line, id)
      check_camel_case(line, id)
      check_spaces_operators(line, id)
    end
  end

  private

  def check_max_line_length(line, id)
    text = 'Maximum Line Length, Limit lines to 50 characters.'
    message = "##{file}:#{id + 1}:".colorize(:cyan) + ' Warning: '.colorize(:yellow) + text
    if max_line_length(line)
      messages.push(message)
      return message
    end
    ''
  end

  private

  def check_no_single_line_methods(line, id)
    text = 'No Single-line Methods, Avoid single-line methods.'
    message = "##{file}:#{id + 1}:".colorize(:cyan) + ' Warning: '.colorize(:yellow) + text
    if no_single_line_methods(line)
      messages.push(message)
      return message
    end
    ''
  end

  private

  def check_spaces_braces(line, id)
    text = "Use space after '{' and before '}'"
    message = "##{file}:#{id + 1}:".colorize(:cyan) + ' Warning: '.colorize(:yellow) + text
    if spaces_braces(line)
      messages.push(message)
      return message
    end
    ''
  end

  private

  def check_spaces_parenthesis(line, id)
    text = "No spaces after '(', '[' or before ']', ')'"
    message = "##{file}:#{id + 1}:".colorize(:cyan) + ' Warning: '.colorize(:yellow) + text
    if spaces_parenthesis(line)
      messages.push(message)
      return message
    end
    ''
  end

  private

  def check_camel_case(line, id)
    text = 'CamelCase for Classes, Use CamelCase for classes and modules.'
    message = "##{file}:#{id + 1}:".colorize(:cyan) + ' Error: '.colorize(:red) + text.colorize(:red)
    if camel_case(line)
      messages.push(message)
      return message
    end
    ''
  end

  private

  def check_spaces_operators(line, id)
    text = 'Spaces and Operators, Use spaces around operators, after commas, colons and semicolons.'
    message = "##{file}:#{id + 1}:".colorize(:cyan) + ' Warning: '.colorize(:yellow) + text
    if spaces_operators(line)
      messages.push(message)
      return message
    end
    ''
  end
end
