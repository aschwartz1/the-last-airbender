require 'rails_helper'

RSpec.describe 'Search by nation page' do
  describe 'happy path' do
    it 'basic page setup' do
      visit search_path(nation: 'fire_nation')
      expect(current_path).to eq(search_path)
    end

    describe 'nation info' do
      it 'shows total number of people living in the nation' do
        visit search_path(nation: 'fire_nation')

        within('#population') do
          expect(page).to have_content(97)
        end
      end

      it 'shows info for 25 members of nation' do
        visit search_path(nation: 'fire_nation')

        within('#people-info') do
          expect(page.all('.person').size).to eq(25)
        end
      end

      it 'shows detailed info for each person' do
        visit search_path(nation: 'fire_nation')

        persons = page.all(:css, '.person')

        within(persons.first) do
          expect(page).to have_content('Chan (Fire Nation admiral)')
          expect(page).to have_content('Ozai')
          expect(page).to have_content('Earth Kingdom')
          expect(page).to have_content('Fire Nation Navy')
        end

        within(persons.last) do
          expect(page).to have_content('Fire Nation train conductor')
          expect(page).to have_content('Aang')
          expect(page).to have_content('Combustion Man')
          expect(page).to have_content('Fire Nation Fire Nation train')
        end
      end

      xit 'shows `none` for allies/enemies if there are none' do
        # TODO find a person w/ those and make capybara select their .person element?
      end

      it 'photos for people when it can' do
        visit search_path(nation: 'fire_nation')
        photos = page.all(:css, '.person-photo')

        # Not sure how to test for a photo actually existing?
        expect(photos.size).to eq(24)
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
