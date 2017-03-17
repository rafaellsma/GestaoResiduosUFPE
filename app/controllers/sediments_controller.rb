class SedimentsController < ApplicationController
  before_action :set_sediment, only: [:show, :edit, :update, :destroy]

  # GET /sediments
  # GET /sediments.json
  def index
    @sediments = Sediment.all
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
    @sediment.laboratory = current_user.laboratory
    @sediment.user = current_user
    @sediment.local = current_user.laboratory
    respond_to do |format|
      if @sediment.save
        format.html { redirect_to @sediment, notice: 'Residuo foi criado com sucesso.' }
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
      params.require(:sediment).permit(:composition, :weight, :volume, :res_type ,:data_registered)
    end
end
