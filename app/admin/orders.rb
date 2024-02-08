# frozen_string_literal: true

ActiveAdmin.register Order do
  permit_params :status
  index do
    selectable_column
    id_column
    column :customer
    column :street
    column :landmark
    column :city
    column :state
    column :country
    column :mobile
    column :payment_method
    column :created_at
    column :status
    actions
  end

  form do |f|
    f.inputs do
      f.input :status, as: :select, collection: Order.statuses.values, selected: Order.statuses.values.first
    end
    f.actions
  end
end
