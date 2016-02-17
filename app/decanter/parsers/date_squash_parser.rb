class DateSquashParser < Decanter::ValueParser::Base

  result :raw

  parser do |name, values, options|
    Decanter::ValueParser::DateParser.parse(name, [values.join('/')])
  end
end
