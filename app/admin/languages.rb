# frozen_string_literal: true

ActiveAdmin.register Language do
  permit_params :name, :value

  index do
    selectable_column
    id_column
    column :name
    column :value
    column :created_at
    actions
  end

  filter :name
  filter :created_at

  form do |f|
    f.semantic_errors(*f.object.errors.attribute_names)
    f.inputs do
      f.input :name
      f.input :value
    end
    f.actions
  end
end
