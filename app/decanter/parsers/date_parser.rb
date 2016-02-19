class DateParser < Decanter::ValueParser::Base
  parser do |name, value, options|
    Date.strptime(value, '%m/%d/%Y') if value.present?
  end
end
