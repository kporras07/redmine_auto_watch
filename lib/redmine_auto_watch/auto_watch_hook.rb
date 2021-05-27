# Hooks to attach to the Redmine Issues.
class AutoWatchHook < Redmine::Hook::Listener
  def controller_issues_edit_before_save(context = {})
    issue = context[:issue]

    # @todo: Differentiate between edited and commented.
    add_current_user(issue, 'auto_watch_issues_edited?')
    add_assignee(issue)
    add_assigned_was(issue)
  end

  def controller_issues_new_before_save(context = {})
    add_current_user(context[:issue], 'auto_watch_issues_created?')
    add_assignee(context[:issue])
  end


  def controller_issues_bulk_edit_before_save(context = {})
    issue = context[:issue]

    # @todo: Differentiate between edited and commented.
    add_current_user(issue, 'auto_watch_issues_edited?')
    add_assignee(issue)
    add_assigned_was(issue)
  end

  private
  def add_current_user(issue, type)
    add_watcher_to_issue(issue, User.current, type)
  end

  def add_assignee(issue)
    add_watcher_to_issue(issue, issue.assigned_to, 'auto_watch_issues_assigned?')
  end

  def add_assigned_was(issue)
    if issue.previous_assignee
      add_watcher_to_issue(issue, issue.previous_assignee, 'auto_watch_issues_assigned?');
    end
  end

  def add_watcher_to_issue(issue, assignee, type)
    return if assignee.nil? || !assignee.is_a?(User) || assignee.anonymous? || !assignee.active? || !assignee.pref.public_send(type)
    issue.add_watcher(assignee) unless issue.watched_by?(assignee)
  end
end
