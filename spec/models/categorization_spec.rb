require "rails_helper"

describe Categorization do
  it "cannot be created without a category" do
    @kitten = Kitten.create(image:"kitten.com")
    @category = Category.create(name:"Cute")
    @categorization = Categorization.new(kitten_id:@kitten.id, category_id:@category.id)
    expect(@categorization).to be_valid

    @categorization.category_id = nil
    expect(@categorization).to_not be_valid
  end

  it "does not allow kitten to be assigned same category twice" do
    @kitten = Kitten.create(image:"kitten.com")
    @category = Category.create(name:"Cute")
    @categorization = Categorization.create(kitten_id:@kitten.id, category_id:@category.id)
    expect(@categorization).to be_valid

    @categorization2 = Categorization.new(kitten_id:@kitten.id, category_id:@category.id)
    expect(@categorization2).to_not be_valid
    expect(@categorization2.errors[:category]).to include("has already been taken")

  end
end