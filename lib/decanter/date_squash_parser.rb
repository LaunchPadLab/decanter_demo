class DateSquashParser < Decanter::ValueParser::Base
  parser do |name, value, options|
    day, month, year = value.map(&:to_i)
    Date.new(year, month, day)
  end
end
