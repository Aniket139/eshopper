# frozen_string_literal: true

ActiveAdmin.register Product do
    permit_params :name, :description, :mrp, :discount_type, :discount_value, :price, :image, :category_id, :brand_id, :business_id, :active, :availability
    index do
      selectable_column
      id_column
      column :name
      column :description
      column :mrp
      column :discount_type
      column :discount_value
      column :price
      column :image
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
        f.input :discount_type
        f.input :discount_value
        f.input :price
        f.input :image, as: :file, input_html: { multiple: true }
        f.input :category
        f.input :brand
        f.input :business
        f.input :active
        f.input :availability
      end
      f.actions
    end

    show do
      product do
        row :name
        row :description
        row :mrp
        row :discount_type
        row :discount_value
        row :price
        row :image
        row :category_id
        row :brand_id
        row :business_id
        row :active
        row :availability
        row :created_at
    end

    product :image do
      div do
        product.image.each do |img|
          div do
            image_tag url_for(img), size: '200x200'
          end
        end
        end
      end
    end
end
  