module Spree::SearchTagCloud::ProductsController
  def self.included(controller)
    controller.class_eval do
      controller.append_after_filter :record_search, :only => :index
    end
  end

  def record_search
    if params[:keywords]
      term = SearchRecord.filter(params[:keywords])
      return if term == ''
      record =  SearchRecord.find_or_initialize_by_term_and_stype(term, 'phrase') 
      record.update_attribute(:count, record.count+1)
      term.split(' ').each do |subterm|
        record = SearchRecord.find_or_initialize_by_term_and_stype(subterm, 'single') 
        record.update_attribute(:count, record.count+1)
      end 
    end
  end
end
