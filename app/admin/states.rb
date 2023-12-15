# frozen_string_literal: true

ActiveAdmin.register State do
    menu priority: 3
    permit_params :name, :country_id
  
    index do
      selectable_column
      id_column
      column :name
      column :country
      column :created_at
      actions
    end
  
    filter :name
    filter :country_id
    filter :created_at
  
    form do |f|
      f.inputs do
        f.input :name
        f.input :country
      end
      f.actions
    end
end
  