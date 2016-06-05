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
end
