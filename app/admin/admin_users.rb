ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation, :nombre, :imagen, :descripcion, :telefono
  
  index do
    selectable_column
    id_column
    column :nombre
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

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |form|
    form.inputs do
      form.input :nombre, as: :string
      form.input :imagen, as: :file
      form.input :email, as: :email
      form.input :password
      form.input :password_confirmation
      form.input :descripcion, as: :text
      form.input :telefono
    end
    form.actions
  end

  controller do
    def create
      @admin_user = AdminUser.new(permitted_params[:admin_user])

      if @admin_user.save
        user = User.new(email: @admin_user.email, password: @admin_user.password, name: @admin_user.nombre, 
                        admin: true, descripcion: @admin_user.descripcion, telefono: @admin_user.telefono)

        user.imagen.attach(@admin_user.imagen.blob)
        user.save
      end
      super
    end

    def update
      @admin_user = AdminUser.find(params[:id])

      if @admin_user.update(permitted_params[:admin_user])
        user = User.find_by(email: @admin_user.email)
        user.update(email: @admin_user.email, password: @admin_user.password, 
                    name: @admin_user.nombre, admin: true, descripcion: @admin_user.descripcion, 
                    telefono: @admin_user.telefono)
        
        user.imagen.purge if user.imagen.attached?
        user.imagen.attach(@admin_user.imagen.blob)
      end
      super
    end
  end

end
