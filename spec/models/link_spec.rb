require 'rails_helper'

describe Link do
  it "has title and url" do
    link_data = {title: "a great webcomic", url: "http://xkcd.com"}
    link = Link.new(link_data)

    expect(link.title).to eq("a great webcomic")
    expect(link.url).to eq("http://xkcd.com")
  end
end
