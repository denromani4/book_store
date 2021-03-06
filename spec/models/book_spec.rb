require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:author) { FactoryGirl.create(:author) }

  context "associations" do
    it { expect(author).to have_many(:books) }
  end
  context "validations" do
    it { expect(author).to validate_presence_of(:firstname) }
    it { expect(author).to validate_presence_of(:lastname) }
  end
  context ".full_name" do
    it "shows firstname and lastname of the author properly" do
      expect(author.full_name).to eq("John Tolkien")
    end
  end
  context ".number_of_books" do
    it "shows number of all author's books" do
      author_book = FactoryGirl.create(:book, author_id: author.id)
      expect(author.number_of_books).to eq(1)
    end
  end
end
