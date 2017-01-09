require 'rails_helper'

describe LinkService do
  it "fetches link from urlockbox" do
    VCR.use_cassette("single_link_urlockbox") do
      read = create(:read, link_id: 7)

      link = LinkService.fetch_by_id(read.link_id)

      expect(link.title).to eq("a great webcomic")
      expect(link.url).to eq("http://xkcd.com")
    end
  end

  it "fetches top read links from urlockbox" do
    VCR.use_cassette("multiple_links_urlockbox") do
      create_list(:read, 4, link_id: 7)
      create_list(:read, 2, link_id: 8)

      top_links = LinkService.fetch_top_reads

      expect(top_links.first.url).to eq("http://xkcd.com")
      expect(top_links.last.url).to eq("http://reddit.com")
    end
  end
end
