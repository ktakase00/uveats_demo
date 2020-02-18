module Sample
  module Menu
    class Item
      attr_accessor :menu_name, :price, :description, :image_file

      def initialize(**hash)
        @menu_name = hash[:menu_name]
        @price = hash[:price]
        @description = hash[:description]
        @image_file = hash[:image_file]
      end

      def self.load_file(file_path)
        item_ary = YAML.load_file(file_path)
        item_ary.map do |hash|
          self.new(hash.symbolize_keys)
        end
      end

      def image_path
        "./lib/samples/menu/files/#{image_file}"
      end

      def uploaded_file
        Rack::Test::UploadedFile.new(self.image_path, "image/jpeg")
      end
    end
  end
end
