# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:country) { FactoryBot.create(:country) } 
  let(:state) { FactoryBot.create(:state, country: country) } 
  let(:city) { FactoryBot.create(:city, state: state) }
  let(:business) { FactoryBot.create(:business, city: city, country: country, state: state) }
  let(:category) { FactoryBot.create(:category, business: business) } 
  let(:brand) { FactoryBot.create(:brand, business: business) } 
  subject { FactoryBot.build(:product, category: category, brand: brand, business: business) }
  
  it "is not valid without value" do
    subject.name = nil
    subject.description = nil
    subject.mrp = nil
    subject.price = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with a negative price" do
    subject.price = -1
    expect(subject).to_not be_valid
  end

  describe "#validate_max_images" do
    image1 = Faker::LoremFlickr.image(size: "640x480")
    image2 = Faker::LoremFlickr.image(size: "640x480")
    image3 = Faker::LoremFlickr.image(size: "640x480")
    image4 = Faker::LoremFlickr.image(size: "640x480")
    image5 = Faker::LoremFlickr.image(size: "640x480")
    context "when there are fewer than or equal to 4 images" do
      let(:product) {FactoryBot.build(images: [image1, image2]) }

      it "should not add any validation errors" do
        product.validate_max_images
        expect(product.errors).to be_empty
      end
    end

    context "when there are more than 4 images" do
      let(:product) { Product.new(images: [image1, image2, image3, image4, image5]) }
      let(:image1) { double("image") }
      let(:image2) { double("image") }
      let(:image3) { double("image") }
      let(:image4) { double("image") }
      let(:image5) { double("image") }

      it "should add validation errors" do
        product.validate_max_images
        expect(product.errors[:images]).to include('cannot exceed 4 images')
      end
    end
  end

  describe "#cover_image" do
    context "when there is a cover image" do
      let(:product) { Product.new }
      let(:cover_image) { double("image", cover: true) }
      let(:image1) { double("image") }
      let(:image2) { double("image") }

      before do
        product.images.attach(cover_image, image1, image2)
      end

      it "should return the cover image" do
        expect(product.cover_image).to eq(cover_image)
      end
    end

    context "when there is no cover image" do
      let(:product) { Product.new }
      let(:image1) { double("image") }
      let(:image2) { double("image") }

      before do
        product.images.attach(image1, image2)
      end

      it "should return the first image" do
        expect(product.cover_image).to eq(image1)
      end
    end
  end
end
