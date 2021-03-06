class SedimentsController < ApplicationController
  before_action :set_sediment, only: [:show, :edit, :update, :destroy]

  # GET /sediments
  # GET /sediments.json
  def index
    if current_user.admin?
      @laboratory = Laboratory.find(params[:laboratory_id])
      @sediments = @laboratory.sediments
      @collect = SedimentsCollect.new(
        sediments: @sediments.where(sediments_collect_id: nil)
      )
    else
      @sediments = current_user.sediments
    end
    @sediments = Sediment.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /sediments/1
  # GET /sediments/1.json
  def show
  end

  # GET /sediments/new
  def new
    @sediment = Sediment.new
  end

  # GET /sediments/1/edit
  def edit
  end

  # POST /sediments
  # POST /sediments.json
  def create
    @sediment = Sediment.new(sediment_params)
    @sediment.data_registered = Time.now
    @sediment.user = current_user
    respond_to do |format|
      if @sediment.save
        format.html { redirect_to sediments_path, notice: 'Residuo foi criado com sucesso.' }
        format.json { render :show, status: :created, location: @sediment }
      else
        format.html { render :new }
        format.json { render json: @sediment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sediments/1
  # PATCH/PUT /sediments/1.json
  def update
    respond_to do |format|
      if @sediment.update(sediment_params)
        format.html { redirect_to @sediment, notice: 'Sediment was successfully updated.' }
        format.json { render :show, status: :ok, location: @sediment }
      else
        format.html { render :edit }
        format.json { render json: @sediment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sediments/1
  # DELETE /sediments/1.json
  def destroy
    @sediment.destroy
    respond_to do |format|
      format.html { redirect_to sediments_url, notice: 'Sediment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sediment
      @sediment = Sediment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sediment_params
      params.require(:sediment).permit(:composition, :weight, :recipient_type,
      :local, :res_type, :volume,:data_registered, :stock_location, :laboratory_id)
    end
end
