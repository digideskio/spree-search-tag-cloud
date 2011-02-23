class SearchRecord < ActiveRecord::Base
  def self.filter(term)
    term.gsub(/\+/, ' ').gsub(/^\s+/, '').gsub(/\s+$/, '').downcase.gsub(/[^a-z\s-]/, '')
  end
end
