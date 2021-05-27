module RedmineAutoWatch
  class Hooks < Redmine::Hook::ViewListener
    render_on :view_my_account_preferences,
              partial: 'hooks/redmine_auto_watch/redmine_auto_watch_preferences'
  end
end
