require 'rails_helper'

describe 'As a user' do
  describe 'when I visit /' do
    it "when I select Gryffindor and click search for memebers, I should see total number of members for that house and I should see a list of the 21 members of the order of the phoenix for that house along with their name, role, house, and patronus" do

      visit '/'

      select 'Gryffindor', from: :house

      click_on 'Search For Members'

      expect(current_path).to eq(search_path)

      expect(page).to have_content('Order of the Phoenix')
      expect(page).to have_content('21 for Gryffindor')

      expect(page).to have_css('.members', count: 21)

      within(first('.members')) do
        expect(page).to have_css('.name')
        expect(page).to have_css('.role')
        expect(page).to have_css('.house')
        expect(page).to have_css('.patronus')
      end
    end
  end
end
