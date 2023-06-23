ActiveAdmin.register Producto do

  permit_params :name, :imagen, :talla, :precio, :color, :user_id

  index do 
    selectable_column
    id_column
    column "Nombre", :name
    column :imagen do |producto|
      if producto.imagen.attached?
        image_tag(producto.imagen.attachment.url, style: 'max-width: 100px; max-height: auto;')
      end
    end
    column :talla
    column :precio
    column :color
    column :user
    column :created_at
    column :updated_at
    actions
  end

  form do |form|
    form.inputs "Detalles" do
      form.input :user, as: :select, collection: [[current_admin_user.nombre, current_admin_user.id]]
      form.input :name, label: "Nombre", as: :string
      form.input :imagen, as: :file
      form.input :talla
      form.input :precio
      form.input :color
    end
    form.actions
  end
  
end
