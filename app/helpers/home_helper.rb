module HomeHelper
  
  # Prettifies a date
  # @param [Date, Time, DateTime] date The date to prettify
  # @return [String] a pretty date
  # @api private
  def pretty_date(date)
    date.strftime('%b %d %I:%M %P')
  end
  
  # Get the url of the tracking service's website by its name
  # @param [String] name The name of the tracking service
  # @return [String] The URL of the tracking service's website
  # @api private
  def link_to_tracking_service(name, package_id = "")
    url = case name
      when "UPS" then package_id.empty? ? "http://www.ups.com" : "http://wwwapps.ups.com/WebTracking/track?trackNums=#{package_id}&track.x=Track"
      when "USPS" then "http://www.usps.com"
      when "FedEx" then "http://www.fedex.com"
      when "MockService" then package_id.empty? ? "mock://www.service.com" : "mock://www.service.com?package_id=#{package_id}"
      else ""
    end
    return name if url.empty?
    return link_to name, url
  end
end
