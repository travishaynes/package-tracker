class HomeController < ApplicationController
  include Trackerific
  
  def index
    if params.include?(:package_id) && !params[:package_id].empty?
      id = params[:package_id]
      @tracking = track_package(id)
      @service = tracking_service(id).service_name
    end
  end
  
end
