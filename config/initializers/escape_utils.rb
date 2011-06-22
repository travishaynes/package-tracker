# fixes an encoding issue in Rack 1.2.1

module Rack
  module Utils
    def escape(s)
      EscapeUtils.escape_url(s)
    end
  end
end
