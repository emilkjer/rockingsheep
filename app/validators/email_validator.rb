require 'mail'
class EmailValidator < ActiveModel::EachValidator
  def validate_each(record,attribute,value)
    begin
      m = Mail::Address.new(value)
      # We must check that value contains a domain and that value is an email address
      r = m.domain && m.address == value
      t = m.__send__(:tree)
      # We need to dig into treetop
      # A valid domain must have dot_atom_text elements size > 1
      # user@localhost is excluded
      # treetop must respond to domain
      # We exclude valid email values like <user@localhost.com>
      # Hence we use m.__send__(tree).domain
      r &&= (t.domain.dot_atom_text.elements.size > 1)
    rescue Exception => e   
      r = false
    end
    # record.errors[attribute] << (options[:message] || "is invalid") unless r
    locale = "activerecord.errors.models.#{record.class.name.downcase}.attributes.#{attribute}.invalid"
    record.errors[attribute] << (options[:message] || I18n.t(locale, :default => 'is invalid')) unless r
  end
end
