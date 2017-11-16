crumb :root do
  link 'Dashboard', admin_root_path
end

crumb :users do
  link 'Administrators', admin_users_path
end

crumb :new_user do
  link 'New Administrator', new_admin_user_path
  parent :users
end

crumb :events do
  link 'Event Schedule', admin_events_path
end

crumb :job_seekers do
  link 'Job Seekers', admin_job_seekers_path
end

crumb :job_seeker do |job_seeker|
  link job_seeker.full_name, admin_job_seeker_path(job_seeker)
  parent :job_seekers
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
