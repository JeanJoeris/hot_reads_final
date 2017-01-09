require 'rails_helper'

describe Api::V1::ReadsController do
  it "creates a read" do
    expect(Read.count).to eq(0)

    post :create, params: { link_id: 1 }

    read = JSON.parse(response.body, symbolize_names: true)
    expect(Read.count).to eq(1)
    expect(read[:link_id]).to eq(1)
  end

  it "creates multiple reads" do
    5.times do
      post :create, params: { link_id: 1}
    end

    expect(Read.count).to eq(5)
    expect(Read.read_count(1)).to eq(5)
  end
end
