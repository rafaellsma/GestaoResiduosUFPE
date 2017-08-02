class Users::RegistrationsController < Devise::RegistrationsController
  layout "devise", only: [:new, :create]

  def new
    @centers = Center.with_laboratories_avaiable
    if @centers.empty?
      redirect_to new_user_session_path, notice: 'Nenhum laboratório está disp'\
      'onivel. Entre em contato com o admininstrador para mais informações'
    else
      @departments = Department.with_laboratories_avaiable_from_center(@centers.first)
      @laboratories = Laboratory.avaiable_from_department(@departments.first)
      super
    end
  end

  def create
    super do
      lab = Laboratory.find(resource.laboratory_id)
      resource.laboratory = lab
    end
  end

  def update_departments
    @departments = Department.with_laboratories_avaiable_from_center(
      Center.find(params[:center_id])
    )
    @laboratories = Laboratory.avaiable_from_department(@departments.first)
    respond_to do |format|
      format.js
    end
  end

  def update_laboratories
    @laboratories = Laboratory.avaiable_from_department(
      Department.find(params[:department_id])
    )
    respond_to do |format|
      format.js
    end
  end
end
