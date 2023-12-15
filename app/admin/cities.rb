# frozen_string_literal: true

ActiveAdmin.register City do
    menu priority: 4
    permit_params :name, :state_id
  
    index do
      selectable_column
      id_column
      column :name
      column :state
      column :created_at
      actions
    end
  
    filter :name
    filter :state_id
    filter :created_at
  
    form do |f|
      f.inputs do
        f.input :name
        f.input :state
      end
      f.actions
    end
end
  