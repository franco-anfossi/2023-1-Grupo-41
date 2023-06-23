ActiveAdmin.register Resena do

  permit_params :usuario, :contenido, :producto_id, :user_id, :calificacion
 
  index do 
    selectable_column
    id_column
    column "Usuario", :user
    column :contenido
    column :calificacion
    column "Producto Asociado", :producto
    column :created_at
    column :updated_at
    actions
  end

  form do |form|
    form.inputs "Detalles" do
      form.input :producto
      form.input :user, as: :select, collection: [[current_admin_user.nombre, current_admin_user.id]]
      form.input :usuario, as: :string
      form.input :contenido
      form.input :calificacion
    end
    form.actions
  end

  controller do
    def create
      super
      @resena.usuario = @resena.user.name
      @resena.save
    end
  
    def update
      super
      @resena.usuario = @resena.user.name
      @resena.save
    end
  end
end
