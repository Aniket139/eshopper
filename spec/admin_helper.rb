module AdminHelper
  def login_as(user)
    visit new_admin_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Login'
   end
end
  
RSpec.configure do |config|
config.include AdminHelper, type: :feature
end