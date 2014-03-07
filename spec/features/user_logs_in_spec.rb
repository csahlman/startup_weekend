require "spec_helper"

feature "User Logs In Spec", js: true do 

  scenario "Successfully" do
    @user = create(:user)

    visit root_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password

    click_on "Login"
    expect(page).to have_css '.flash', text: "Welcome"

  end

end