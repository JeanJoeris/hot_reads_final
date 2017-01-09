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

  it "finds only top 10 reads" do
    15.times do |n|
      create(:read, link_id: n)
    end
    create(:read)

    top_reads = Read.top_reads

    expect(top_reads.count).to eq(10)
    expect(top_reads.keys.first).to eq(1)
  end

  it "finds only reads from last 24 hrs" do
    create(:read)
    20.times do
      create(:read, created_at: 5.days.ago)g
    end

    top_reads = Read.top_reads
    expect(top_reads[1]).to eq(1)
  end
end
