require 'spec_helper'

feature 'user can like an event', js: true do
	scenario 'user successfully likes an event' do
	  event = create(:event, title: 'Pie Shake Make')
	  visit(event_path(event))
	  sign_in
	  page.should have_content('Pie Shake Make')
	  page.should have_css('[title="Heart This"]')
	end

	def sign_in
      user = create(:user)
      fill_in 'email', with: user.email
      fill_in 'password', with: user.password
      click_button 'login'
    end
end	