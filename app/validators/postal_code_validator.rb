# coding: utf-8
class PostalCodeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless /\A\d{3}\-\d{4}\z/ === value
      record.errors[attribute] << (options[:message] || "数字3桁-数字4桁の形式で入力してください。例: 123-4567")
    end
  end
end
