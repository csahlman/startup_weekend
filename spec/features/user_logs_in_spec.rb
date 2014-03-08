require "spec_helper"

feature "User Logs In Spec", js: true do 

  scenario "Successfully" do
    @user = create(:user)

    visit root_path
    fill_in "email", with: @user.email
    fill_in "password", with: @user.password

    click_on "Sign In"
    expect(page).to have_css '.alert', text: "Welcome #{@user.name}"

  end

  scenario "Unsuccessfully" do 
    @user = create(:user)

    visit root_path
    fill_in "email", with: "Bad Email"
    fill_in "password", with: "Bad Password"

    click_on "Sign In"

    expect(page).to have_css '.alert', text: "Bad Credentials"

  end

end