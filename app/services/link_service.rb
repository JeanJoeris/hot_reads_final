class LinkService
  def self.fetch_by_id(link_id)
    if Rails.env == "production"
      urlockbox_url = "https://jj-urlockbox.herokuapp.com/api/v1/links/#{link_id}"
    else
      urlockbox_url = "http://localhost:3050/api/v1/links/#{link_id}"
    end
    response = Faraday.get(urlockbox_url)
    Link.new(JSON.parse(response.body, symbolize_names: true))
  end

  def self.fetch_top_reads
    Read.top_reads.keys.map do |link_id|
      fetch_by_id(link_id)
    end
  end
end
