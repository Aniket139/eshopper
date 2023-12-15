# frozen_string_literal: true

ActiveAdmin.register Business do
    permit_params :name, :city_id, :state_id, :country_id, :email, :mobile
    index do
      selectable_column
      id_column
      column :name
      column :city
      column :state
      column :country
      column :email
      column :mobile
      column :created_at
      actions
    end
  
    filter :name
    filter :country_id
    filter :created_at
  
    form do |f|
      f.inputs do
        f.input :name
        f.input :city
        f.input :state
        f.input :country
        f.input :email
        f.input :mobile
      end
      f.actions
    end
end
  