ActiveAdmin.register State do
    permit_params :name, :country_id
  
    index do
      selectable_column
      id_column
      column :name
      column :country_id
      column :created_at
      actions
    end
  
    filter :name
    filter :country_id
    filter :created_at
  
    form do |f|
      f.semantic_errors *f.object.errors.attribute_names
      f.inputs do
        f.input :name
        f.input :country_id
      end
      f.actions
    end
  
  end
  