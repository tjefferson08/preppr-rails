class ImportRecipe
  def initialize(url)
    @url = url
  end

  def run
    url = URI.parse(@url)
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) { |http| http.request(req) }
    doc = Nokogiri::HTML(res.body)
    'hi'
  end
end
