class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  protect_from_forgery except: [:create, :update]

  # GET /stores
  # GET /stores.json
  def index
    @stores = Store.order(city: :desc)
  end

  # GET /stores/1
  # GET /stores/1.json
  def show
    case @store.id
    when 1
      redirect_to "https://www.lunge.de/filialen/barmbek", status: 301
    when 3
      redirect_to "https://www.lunge.de/filialen/city", status: 301
    when 4
      redirect_to "https://www.lunge.de/filialen/bahrenfeld", status: 301
    when 5
      redirect_to "https://www.lunge.de/filialen/charlottenburg", status: 301
    end
  end

  # GET /stores/new
  def new
    @store = Store.new
  end

  # GET /stores/1/edit
  def edit
  end

  # POST /stores
  # POST /stores.json
  def create
    @store = Store.new(store_params)

    respond_to do |format|
      if @store.save
        format.html { redirect_to @store, notice: 'Store was successfully created.' }
        format.json { render action: 'show', status: :created, location: @store }
      else
        format.html { render action: 'new' }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stores/1
  # PATCH/PUT /stores/1.json
  def update
    respond_to do |format|
      if @store.update(store_params)
        format.html { redirect_to @store, notice: 'Store was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stores/1
  # DELETE /stores/1.json
  def destroy
    @store.destroy
    respond_to do |format|
      format.html { redirect_to stores_url }
      format.json { head :no_content }
    end
  end

  def get_directions
    @store = Store.find(params[:id])
    @directions = JSON.load(open("http://maps.googleapis.com/maps/api/directions/json?origin=#{URI::encode(params[:origin])}&destination=#{URI::encode(@store.full_address)}&sensor=false&region=de&language=de&alternatives=true&departure_time=#{Time.now.to_i}&mode=transit"))
    render action: "show"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_params
      params.require(:store).permit(
        :id,
        :name,
        :description,
        :address_name,
        :street,
        :zip,
        :city,
        :phone,
        :email,
        :active,
        :latitude,
        :longitude,
        :google_maps_place_id,
        :panorama_embed_url,
        :frontend_url,
        store_images_attributes: [
          :id,
          :store_id,
          :default,
          :image,
          :_destroy
        ]
      )
    end
end
