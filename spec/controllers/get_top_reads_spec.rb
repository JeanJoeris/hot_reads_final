require 'rails_helper'

describe Api::V1::ReadsController do
  it "gives the top reads" do
    create_list(:read, 5, link_id: 7)
    create_list(:read, 2, link_id: 8)

    get :index

    top_reads = JSON.parse(response.body)

    expect(top_reads.count).to eq(2)
    expect(top_reads.keys.first.to_i).to eq(7)
    expect(top_reads.keys.last.to_i).to eq(8)
  end
end
