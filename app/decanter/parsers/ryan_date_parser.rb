class RyanDateParser < Decanter::ValueParser::Base
  parser do |name, value, options|
    parse_format = options.fetch(:ryans_format, '%m/%d/%Y')
    Date.strptime(value, parse_format)
  end
end
