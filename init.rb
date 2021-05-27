require 'redmine'

require_dependency 'redmine_auto_watch'

Redmine::Plugin.register :redmine_auto_watch do
  name 'Redmine Auto Watch plugin'
  author 'Kevin Porras'
  description 'This plugin is a hook to add users in the issue watchers list automatically when they are involved in it.'
  version '1.0.0'
end
