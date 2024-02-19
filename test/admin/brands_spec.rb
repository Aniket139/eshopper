require 'rails_helper'

describe "Brands", type: :feature do
  let(:country) { FactoryBot.create(:country) } 
  let(:state) { FactoryBot.create(:state, country: country) } 
  let(:city) { FactoryBot.create(:city, state: state) }
  let(:business) { FactoryBot.create(:business, city: city, country: country, state: state) } 
  let(:brand) { FactoryBot.create(:brand, business: business) }
  let(:admin_user) {FactoryBot.create(:admin_user) }
#   before do
#     sign_in admin_user
#   end

  describe 'index' do
    it 'displays the list of brands' do
      visit admin_brands_path
      expect(page).to have_content(bwrand.name)
      expect(page).to have_content(brand.description)
      expect(page).to have_content(brand.business.name)
      expect(page).to have_content(brand.active)
    end
  end

  describe 'show' do
    it 'displays the brand details' do
      visit admin_brand_path(brand)
      expect(page).to have_content(brand.name)
      expect(page).to have_content(brand.description)
      expect(page).to have_content(brand.business.name)
      expect(page).to have_content(brand.active)
    end
  end

  describe 'new' do
    it 'creates a new brand' do
      visit new_admin_brand_path

      fill_in 'Name', with: 'New Brand'
      fill_in 'Description', with: 'Brand Description'
      select business.name, from: 'Business'
      check 'Active'

      click_button 'Create Brand'

      expect(page).to have_content('Brand was successfully created.')
      expect(page).to have_content('New Brand')
    end
  end

  describe 'edit' do
    it 'updates the brand details' do
      visit edit_admin_brand_path(brand)

      fill_in 'Name', with: 'Updated Brand'
      fill_in 'Description', with: 'Updated Brand Description'
      uncheck 'Active'

      click_button 'Update Brand'
      
      expect(page).to have_content('Brand was successfully updated.')
      expect(page).to have_content('Updated Brand')
      expect(page).to have_content('Updated Brand Description')
      expect(page).to_not have_content('Active')
    end
  end
end

