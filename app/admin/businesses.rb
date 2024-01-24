# frozen_string_literal: true

ActiveAdmin.register Business do
  menu priority: 5
  permit_params :name, :city_id, :state_id, :country_id, :email, :mobile, :pincode, :landmark, :street
  index do
    selectable_column
    id_column
    column :name
    column :email
    column :mobile
    column :street
    column :landmark
    column :pincode
    column :city
    column :state
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
      f.input :email
      f.input :mobile
      f.input :street
      f.input :landmark
      f.input :pincode
      f.input :city
      f.input :state
      f.input :country
    end
    f.actions
  end
end
