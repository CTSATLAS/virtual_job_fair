module UsersHelper
  def account_type_title
    case params[:account_type]
    when 'jobseeker' then 'Register as a Job Seeker'
    when 'employer' then 'Register as an Employer'
    end
  end

  def account_type_registration_warning
    case params[:account_type]
    when 'jobseeker'
      opposite_account_type = 'an Employer'
      registration_link = sign_up_path(account_type: 'employer')
    else
      opposite_account_type = 'a Job Seeker'
      registration_link = sign_up_path(account_type: 'jobseeker')
    end

    content_tag :div, class: 'alert alert-warning' do
      raw "If you are #{opposite_account_type} and you want to create an account, #{link_to('click here', registration_link, class: 'alert-link')}"
    end
  end
end
