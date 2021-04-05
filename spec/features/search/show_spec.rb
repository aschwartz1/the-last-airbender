require 'rails_helper'

RSpec.describe 'Search by nation page' do
  describe 'happy path' do
    xit 'basic page setup' do
      visit search_path
      expect(current_path).to eq(search_path)
    end

    describe 'nation info' do
      it 'shows total number of people living in the nation' do
        visit search_path(nation: 'fire_nation')

        within('#population') do
          expect(page).to have_content(97)
        end
      end
    end
  end

  describe 'sad path' do
    xit 'no nation was passed' do
    end

    xit 'nation param does not exist in api db' do

    end
  end
end
