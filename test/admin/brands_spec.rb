require 'rails_helper'

RSpec.feature "Brand management in Active Admin", type: :feature do
  let(:admin_user) { FactoryBot.create(:admin_user) }
  let(:country) { FactoryBot.create(:country) } 
  let(:state) { FactoryBot.create(:state, country: country) } 
  let(:city) { FactoryBot.create(:city, state: state) }
  let(:business) { FactoryBot.create(:business, city: city, country: country, state: state) } 
    
  before do
    login_as(admin_user, scope: :admin_user)
  end

  scenario "Admin user views the list of brands" do
    brand = FactoryBot.create(:brand, business: business) 

    visit admin_brands_path

    expect(page).to have_content("Listing Brands")
    expect(page).to have_content(brand.name)
    expect(page).to have_content(brand.description)
    expect(page).to have_content(brand.business.name)
    expect(page).to have_content(brand.active)
    expect(page).to have_content(brand.created_at)
  end

  scenario "Admin user creates a new brand" do
    business = create(:business) # Assuming you have a factory for businesses
    new_brand_attributes = attributes_for(:brand, business_id: business.id)

    visit new_admin_brand_path

    fill_in "Name", with: new_brand_attributes[:name]
    fill_in "Description", with: new_brand_attributes[:description]
    select business.name, from: "Business"
    check "Active" if new_brand_attributes[:active]

    click_button "Create Brand"

    expect(page).to have_content("Brand was successfully created.")
    expect(page).to have_content(new_brand_attributes[:name])
    expect(page).to have_content(new_brand_attributes[:description])
    expect(page).to have_content(business.name)
    expect(page).to have_content(new_brand_attributes[:active])
  end

  # Add more scenarios for other actions like editing, deleting, etc.
end