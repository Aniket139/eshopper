# frozen_string_literal: true

ActiveAdmin.register Holidaysoffer do
  menu priority: 9
  permit_params :date, :name, :active

  index do
    selectable_column
    id_column
    column :date
    column :name
    column :active
    actions
  end

  filter :date

  form do |f|
    f.inputs do
      f.input :date
      f.input :name
      f.input :active
    end
    f.actions
  end
end
