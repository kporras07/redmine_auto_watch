require_dependency 'redmine_auto_watch/hooks'
require_dependency 'redmine_auto_watch/patches/user_preferences_patch'
require_dependency 'redmine_auto_watch/auto_watch_hook'

ActiveSupport::Reloader.to_prepare do
  unless UserPreference.included_modules.include?(RedmineAutoWatch::Patches::UserPreferencesPatch)
    UserPreference.send :prepend, RedmineAutoWatch::Patches::UserPreferencesPatch
  end
end