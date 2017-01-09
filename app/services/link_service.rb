class LinkService
  def self.fetch_by_id(link_id)
    response = Faraday.get("http://localhost:3050/api/v1/links/#{link_id}")
    Link.new(JSON.parse(response.body, symbolize_names: true))
  end

  def self.fetch_top_reads
    Read.top_reads.keys.map do |link_id|
      fetch_by_id(link_id)
    end
  end
end
