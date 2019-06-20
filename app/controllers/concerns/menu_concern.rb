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
          if params.length == 1
          url = @@controller.send(params[0])
          else
          url = @@controller.send(params[0], params[1])
          end
          yield MenuItem.new item['label'], url, item['turbolinks']
        else
          yield MenuItem.new item['label'], item['link'], item['turbolinks']
        end
      end
    end

  end

  class MenuItem
    def initialize(label, url, turbolinks=true)
      @@label = label
      @@url = url
      @@turbolinks = turbolinks
    end

    def label
      @@label
    end

    def url
      @@url
    end
    
    def turbolinks
      @@turbolinks
    end

  end

end


module MenuConcern
  extend ActiveSupport::Concern

  def setup_menu
    @menu = CvMenu::Menu.new(self)
  end

end
