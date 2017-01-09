require 'rails_helper'

describe "top reads index" do
  it "shows the tops reads" do
    VCR.use_cassette("show_top_reads") do
      create_list(:read, 5, link_id: 7)
      create_list(:read, 2, link_id: 8)

      visit root_path

      expect(page).to have_link("a great webcomic")
      expect(page).to have_link("a time-waster")
    end
  end
end
