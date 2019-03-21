module PageAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        field :title
        field :description
        field :body, :ck_editor
      end
      list do
        field :title
        field :slug
        field :description
        field :created_at
        field :updated_at
      end
    end
  end

end
