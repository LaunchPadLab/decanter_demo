class DateSquashParser < Decanter::ValueParser::Base
  parser do |name, values, options|
    day, month, year = values.map(&:to_i)
    Date.new(year, month, day)
  end
end
