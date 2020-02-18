module Sample
  module Menu
    class List
      MENU_ITEM_ARY = Sample::Menu::Item.load_file('./lib/samples/menu/list.yml')

      def self.fetch(n)
        MENU_ITEM_ARY[(n - 1) % MENU_ITEM_ARY.length]
      end
    end
  end
end
