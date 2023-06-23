ActiveAdmin.register User do

  permit_params :email, :password, :password_confirmation, :name, :imagen, :descripcion, :telefono
  
  index do
    selectable_column
    id_column
    column "Nombre", :name
    column :imagen do |producto|
      if producto.imagen.attached?
        image_tag(producto.imagen.attachment.url, style: 'max-width: 100px; max-height: auto;')
      end
    end
    column :email
    column :descripcion
    column :telefono
    column :sign_in_count
    column :created_at
    actions
  end

  form do |form|
    form.inputs do
      form.input :name
      form.input :email
      form.input :password
      form.input :password_confirmation
      form.input :imagen, as: :file
      form.input :descripcion
      form.input :telefono
    end
    form.actions
  end

end
