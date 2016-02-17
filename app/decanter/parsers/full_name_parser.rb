class FullNameParser < Decanter::ValueParser::Base

  result :raw

  parser do |name, values, options|
    Hash[
      [:first_name, :last_name]
        .map { |v| options.has_key?(:prefix) ? "#{options[:prefix]}_#{v}" : v }
        .zip values.split(' ')
    ]
  end
end
