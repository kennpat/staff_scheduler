require 'rails_helper'

featuer 'A user wants to be able to asign a project to staff person', %{
  As a user
  I want to be able to assign a staff person to a project
  So that they will be able to login and see what projects they are assigned to
} do

  before :each do
    @user = FactoryGirl.create(:user)
    @user2 = FactoryGirl.create(:user)
    login_as(@user)
  end
  #This will need to be updated to use the a JavaScript dropdown calendar to select the dates instead of filling them in.
  scenario 'User creates a new project' do
    visit new_project_path
    fill_in 'Project Name', with: 'Some Company Audit'
    fill_in 'Start Date', with: '3/21/16'
    fill_in 'End Date', with: '3/25/16'
    select('Bob FromAccounting', from: 'Available Staff')
    click_on 'Create Project'
  end

end
