require 'rails_helper'

describe 'As a user' do
  describe 'when I visit /' do
    it "when I select Gryffindor and click search for memebers, I should see total number of members for that house and I should see a list of the 21 members of the order of the phoenix for that house" do
      visit '/'

      select 'Gryffindor', from: :house

      click_on 'Search For Members'

      expect(current_path).to eq(search_path)

      expect(page).to have_content('21 for Gryffindor')
      expect(page).to have_content('Order of the Phoenix members')

      expect(page).to have_css('.members', count: 21)

      within(first('.members')) do
        expect(page).to have_css('.name')
      end
    end
  end
end



# Then I should see a total of the number of members for that house. (21 for Gryffindor)
# And I should see a list of the 21 members of the Order of the Phoenix for house Gryffindor.
#
# And for each of the members I should see:
# - The name of the member
# - The members role (if it exists)
# - The house the member belongs to
# - The Patronus of the member (if it exists)
