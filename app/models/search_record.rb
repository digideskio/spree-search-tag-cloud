class SearchRecord < ActiveRecord::Base
  def self.filter(term)
    term.gsub(/\+/, ' ').gsub(/\s+/, ' ').gsub(/^\s+/, '').gsub(/\s+$/, '').downcase.gsub(/[^0-9a-z\s-]/, '')
  end
end
