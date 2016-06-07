require 'rails_helper'

feature 'Reviewing' do
  before { create_greenspace }

  scenario 'user can complete a form to leave a review' do

    visit '/greenspaces'
    click_button 'Review Richmond Park'
    fill_in "What's it like?", with: "Best park ever!"
    select '5', from: 'Score'
    click_button 'Leave Review'

    expect(current_path).to eq '/greenspaces'
    expect(page).to have_content 'Best park ever!'
  end

end
