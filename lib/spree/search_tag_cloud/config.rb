module Spree
  module SearchTagCloud
    # Singleton class to access the google base configuration object (SearchTagCloudConfiguration.first by default) and it's preferences.
    #
    # Usage:
    #   Spree::SearchTagCloud::Config[:foo]                  # Returns the foo preference
    #   Spree::SearchTagCloud::Config[]                      # Returns a Hash with all the google base preferences
    #   Spree::SearchTagCloud::Config.instance               # Returns the configuration object (SearchTagCloudConfiguration.first)
    #   Spree::SearchTagCloud::Config.set(preferences_hash)  # Set the google base preferences as especified in +preference_hash+
    class Config
      include Singleton
      include PreferenceAccess

      class << self
        def instance
          return nil unless ActiveRecord::Base.connection.tables.include?('configurations')
          SearchTagCloudConfiguration.find_or_create_by_name("Default product reviews and ratings configuration")
        end
      end
    end
  end
end
