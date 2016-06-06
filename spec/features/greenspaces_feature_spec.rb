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

  context 'viewing greenspaces' do

    let!(:richmond_park) { Greenspace.create(name: 'Richmond Park') }

    scenario 'lets a user view a greenspace page' do
      visit '/greenspaces'
      click_link 'Visit Richmond Park'
      expect(page).to have_content 'Richmond Park'
      expect(current_path).to eq "/greenspaces/#{richmond_park.id}"
    end
  end

  context 'editing greenspaces' do

    before { Greenspace.create name: 'Richmond Park', description: 'Best park in Greater London' }

    scenario 'let a user edit a greenspace' do

      visit '/greenspaces'
      click_link 'Edit Richmond Park'
      fill_in 'Name', with: 'Royal Richmond Park'
      fill_in 'Description', with: 'Best park in the South of England'
      click_button 'Update Greenspace'
      click_link 'Visit Royal Richmond Park'
      expect(page).to have_content 'Royal Richmond Park'
      expect(page).to have_content 'Best park in the South of England'
    end
  end

end
