class RyanParser < Decanter::ValueParser::Base
  parser do |name, value, options|
    value
  end
end