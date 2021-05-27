require_dependency 'user_preference'

module RedmineAutoWatch
  module Patches
    module UserPreferencesPatch

      def self.prepended(base)
        base.class_eval do
          if defined? safe_attributes
            safe_attributes :auto_watch_issues_created
          end
        end
      end

      def auto_watch_issues_created
        self[:auto_watch_issues_created]
      end

      def auto_watch_issues_created=(val)
        self[:auto_watch_issues_created] = val
      end

      def auto_watch_issues_created?
        self[:auto_watch_issues_created]
      end

    end
  end
end