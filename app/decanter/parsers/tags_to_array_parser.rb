class TagsToArrayParser < Decanter::ValueParser::Base

  result :raw

  allow Array

  parser do |name, values, options|
    { name => values.split(',').map(&:strip) }
  end
end
