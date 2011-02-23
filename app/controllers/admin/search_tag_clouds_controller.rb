class Admin::SearchTagCloudsController < Admin::BaseController
  def index
    @search_records = SearchRecord.all.collect { |r| [r.count, r.term] }.sort.reverse[0..Spree::SearchTagCloud::Config[:count]]
    max = @search_records.empty? ? 1 : @search_records.first.first

    #solution is: a*x_factor - y_shift = font size 
    x_factor = (Spree::SearchTagCloud::Config[:max] - Spree::SearchTagCloud::Config[:min]) / max.to_f
    y_shift = max.to_f*x_factor - Spree::SearchTagCloud::Config[:max]

    @search_records_cloud = @search_records.shuffle.inject([]) do |a, b|
      a.push([b[0].to_f*x_factor - y_shift, b[1]])
      a
    end
  end
end
