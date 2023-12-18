# frozen_string_literal: true

ActiveAdmin.register Product do
    menu priority: 8

    permit_params :name, :description, :mrp, :discount_type, :discount_value,
                  :price, :category_id, :brand_id, :business_id, :active, :availability, images: []
    
    index do
      selectable_column
      id_column
      column :name
      column :description
      column :mrp
      column :discount_type
      column :discount_value
      column :price
      column :category
      column :brand
      column :business
      column :active
      column :availability
      column :created_at
      actions
    end

  
    filter :name
    filter :brand
    filter :category
    filter :business
    filter :created_at
  
    form do |f|
      f.inputs do
        f.input :name
        f.input :description
        f.input :mrp
        f.input :discount_type, as: :select, collection: ['Flat Discount', 'Deal of the day']
        f.input :discount_value
        f.input :price
        f.input :images, as: :file, input_html: { multiple: true }
        f.input :category
        f.input :brand
        f.input :business
        f.input :active
        f.input :availability, as: :select, collection: ['In stock', 'Out of stock', 'Limited stock']
      end
      f.actions
    end
    
    show do
      attributes_table do
        %i[name description mrp discount_type discount_value price images category brand business active].each do |attr|
          row attr
        end
        row :images do
          div do
            product.images.each do |img|
              div do
                image_tag url_for(img), size: '200x200'
              end
            end
          end
        end
      end
    end
end
  