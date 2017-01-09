require 'rails_helper'

RSpec.describe Read, type: :model do
  it "finds how many counts a read has" do
    3.times do
      create(:read)
    end
    create(:read, link_id: 2)

    expect(Read.read_count(1)).to eq(3)
    expect(Read.read_count(2)).to eq(1)
  end

  it "finds top reads" do
    3.times do
      create(:read)
    end
    create(:read, link_id: 2)

    top_reads = Read.top_reads

    expect(top_reads[1]).to eq(3)
    expect(top_reads[2]).to eq(1)
  end
end
