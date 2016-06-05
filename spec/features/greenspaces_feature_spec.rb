require 'rails_helper'


feature 'greenspaces' do


  context 'none have been added yet' do
    scenario 'should display a prompt to add a greenspace' do
      visit '/greenspaces'
      expect(page).to have_content 'No greenspaces added yet'
      expect(page).to have_link 'Add a greenspace'
    end
  end

  context 'have been added' do
    before do
      Greenspace.create(name: 'Richmond Park')
    end

    scenario 'display list of greenspaces' do
      visit '/greenspaces'
      expect(page).to have_content('Richmond Park')
      expect(page).not_to have_content 'No greenspaces added yet'
    end
  end

  context 'creating greenspaces' do
    scenario 'prompts user to fill out a form, then displays the new greenspace' do
      visit '/greenspaces'
      click_link 'Add a greenspace'
      fill_in 'Name', with: 'Richmond Park'
      click_button 'Create Greenspace'
      expect(page).to have_content 'Richmond Park'
      expect(current_path).to eq '/greenspaces'
    end
  end

end
