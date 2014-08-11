require 'rails_helper'

describe "Categorizations" do
  it "cannot be created without a category" do

    @kitten = Kitten.create(image:"cats.com")
    @category = Category.create(name: "Cutest!")

    @categorization = Categorization.new(kitten_id: @kitten.id, category_id: @category.id)

    expect(@categorization).to be_valid

    @categorization.category_id = nil

    expect(@categorization).to_not be_valid

  end

  it "will not allow the same category for the same kitten" do

    @kitten = Kitten.create(image:"cats.com")
    @category = Category.create(name: "Cutest!")

    @categorization = Categorization.create(kitten_id: @kitten.id, category_id: @category.id)

    expect(@categorization).to be_valid

    @categorization2 = Categorization.new(kitten_id: @kitten.id, category_id: @category.id)

    expect(@categorization2).to_not be_valid
  end
end