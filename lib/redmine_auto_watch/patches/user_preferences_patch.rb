require_dependency 'user_preference'

module RedmineAutoWatch
  module Patches
    module UserPreferencesPatch

      def self.prepended(base)
        base.class_eval do
          if defined? safe_attributes
            safe_attributes :auto_watch_issues_created
            safe_attributes :auto_watch_issues_edited
            safe_attributes :auto_watch_issues_commented
            safe_attributes :auto_watch_issues_assigned
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
        self[:auto_watch_issues_created] == '1'
      end

      def auto_watch_issues_edited
        self[:auto_watch_issues_edited]
      end

      def auto_watch_issues_edited=(val)
        self[:auto_watch_issues_edited] = val
      end

      def auto_watch_issues_edited?
        self[:auto_watch_issues_edited] == '1'
      end

      def auto_watch_issues_commented
        self[:auto_watch_issues_commented]
      end

      def auto_watch_issues_commented=(val)
        self[:auto_watch_issues_commented] = val
      end

      def auto_watch_issues_commented?
        self[:auto_watch_issues_commented] == '1'
      end

      def auto_watch_issues_assigned
        self[:auto_watch_issues_assigned]
      end

      def auto_watch_issues_assigned=(val)
        self[:auto_watch_issues_assigned] = val
      end

      def auto_watch_issues_assigned?
        self[:auto_watch_issues_assigned] == '1'
      end

    end
  end
end