require 'rails_helper'

feature 'Reviewing' do
  before { create_greenspace }

  scenario 'user can complete a form to leave a review' do

    visit '/greenspaces'
    click_link 'Visit Richmond Park'
    click_link 'Review Richmond Park'
    # click_button 'Review Richmond Park'
    fill_in "Thoughts", with: "Best park ever!"
    select '5', from: 'Rating'
    click_button 'Leave Review'
    click_link 'Visit Richmond Park'

    # expect(current_path).to eq '/greenspaces'
    expect(page).to have_content 'Best park ever!'
  end

end
