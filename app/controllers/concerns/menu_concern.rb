module CvMenu
  class Menu
    def initialize(controller)
      file = File.join(Rails.root, 'config', 'menu.yml')
      if !File.exists?(file)
        raise "File not exists"
      end
      @@config = YAML.load_file file
      @@controller = controller
    end

    def items
      @@config['menu']['items'].each do |item|
        if item['link'].start_with? ':'
          method_name = item['link'].slice 1 .. item['link'].length
          params = method_name.split(' ')
          url = @@controller.send(params[0], params[1])
          yield MenuItem.new item['label'], url
        else
          yield MenuItem.new item['label'], item['link']
        end
      end
    end

  end

  class MenuItem
    def initialize(label, url)
      @@label = label
      @@url = url
    end

    def label
      @@label
    end

    def url
      @@url
    end

  end

end


module MenuConcern
  extend ActiveSupport::Concern

  def setup_menu
    @menu = CvMenu::Menu.new(self)
  end

end
