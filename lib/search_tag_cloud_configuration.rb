class SearchTagCloudConfiguration < Configuration
  preference :count, :integer, :default => 100
  preference :max, :float, :default => 25
  preference :min, :float, :default => 8
end
