require "ostruct"

module Muni
  class NextBusError < StandardError; end
  class Base < OpenStruct
    class << self
      def set_agency(agency_tag)
        @@agency_tag = agency_tag.to_s
      end
      
      private

      def fetch(command, options = {})
        url = build_url(command, options)
        xml = Net::HTTP.get(URI.parse(url))
        doc = XmlSimple.xml_in(xml) || {}
        fail NextBusError, doc['Error'].first['content'].gsub(/\n/,'') if doc['Error']
        doc
      end

      def build_url(command, options = {})
        agency = @@agency_tag || 'sf-muni'
        url = "http://webservices.nextbus.com/service/publicXMLFeed?command=#{command}&a=#{agency}"
        options.each { |key,value| url << "&#{key}=#{value}" }
        url
      end

    end
  end
end
