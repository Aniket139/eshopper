# frozen_string_literal: true

ActiveAdmin.register Brand do
    permit_params :name, :description, :business_id, :active
  
    index do
      selectable_column
      id_column
      column :name
      column :description
      column :business
      column :active
      column :created_at
      actions
    end
  
    filter :name
    filter :business
    filter :created_at
  
    form do |f|
      f.inputs do
        f.input :name
        f.input :description
        f.input :business
        f.input :active
      end
      f.actions
    end
end
  