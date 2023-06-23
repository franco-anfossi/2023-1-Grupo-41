ActiveAdmin.register Compra do

  permit_params :valor, :producto_id, :user_id, :descripcion

  index do 
    selectable_column
    id_column
    column "Usuario", :user
    column :valor
    column :descripcion
    column "Producto Asociado", :producto
    column :created_at
    column :updated_at
    actions
  end

  form do |form|
    form.inputs "Detalles" do
      form.input :producto
      form.input :user, as: :select, collection: [[current_admin_user.nombre, current_admin_user.id]]
      form.input :valor
      form.input :descripcion
    end
    form.actions
  end
end
