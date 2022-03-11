class ImportRecipe
  def initialize(url)
    @url = url
  end

  def run
    url = URI.parse(@url)
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port, use_ssl: true) { |http| http.request(req) }
    doc = Nokogiri::HTML(res.body)
    data = JSON.parse(doc.css('script[type="application/ld+json"]').text)

    {
      name: data["name"],
      image_url: data["image"],
      # TODO: serialized field
      instructions: Array.wrap(data["recipeInstructions"]).map { |i| i["text"] }.join("\n")
    }
  end
end
