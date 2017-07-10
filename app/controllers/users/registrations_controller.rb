class Users::RegistrationsController < Devise::RegistrationsController
  layout "devise", only: [:new, :create]
  
  def new
    @centers = Center.all
    @departments = Department.where("center_id = ?", @centers.first)
    @laboratories = Laboratory.where("department_id = ?", @departments.first)
    super
  end

  def create
    @centers = Center.all
    @departments = Department.where("center_id = ?", @centers.first)
    @laboratories = Laboratory.where("department_id = ?", @departments.first)
    super do
      lab = Laboratory.find(resource.laboratory_id)
      resource.laboratory = lab
    end
  end

  def update_departments
    @departments = Department.where("center_id = ?", params[:center_id])
    @laboratories = Laboratory.where("department_id = ?", @departments.first)
    respond_to do |format|
      format.js
    end
  end

  def update_laboratories
    @laboratories = Laboratory.where("department_id = ?", params[:department_id])
    respond_to do |format|
      format.js
    end
  end
end
