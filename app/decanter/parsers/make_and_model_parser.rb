class MakeAndModelParser < Decanter::ValueParser::Base

  result :raw

  parser do |name, value, options|
    [:make, :model].zip value.split(' ')
  end
end
