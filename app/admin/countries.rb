# frozen_string_literal: true

ActiveAdmin.register Country do
  menu priority: 2
  permit_params :name

  index do
    selectable_column
    id_column
    column :name
    column :created_at
    actions
  end

  filter :name
  filter :created_at

  form do |f|
    f.semantic_errors(*f.object.errors.attribute_names)
    f.inputs do
      f.input :name
    end
    f.actions
  end
end
