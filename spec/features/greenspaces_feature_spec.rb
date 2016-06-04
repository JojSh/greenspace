require 'rails_helper'

feature 'greenspaces' do
  context 'none have been added yet' do
    scenario 'should display a prompt to add a greenspace' do
      visit '/greenspaces'
      expect(page).to have_content 'No greespaces added yet'
      expect(page).to have_link 'Add a greenspace'
    end
  end
end