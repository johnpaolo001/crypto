class CryptolistsController < ApplicationController
  before_action :set_cryptolist, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /cryptolists
  # GET /cryptolists.json
  def index
    @cryptolists = Cryptolist.all
  end

  # GET /cryptolists/1
  # GET /cryptolists/1.json
  def show
  end

  # GET /cryptolists/new
  def new
    @cryptolist = Cryptolist.new
  end

  # GET /cryptolists/1/edit
  def edit
  end

  # POST /cryptolists
  # POST /cryptolists.json
  def create
    @cryptolist = Cryptolist.new(cryptolist_params)

    respond_to do |format|
      if @cryptolist.save
        format.html { redirect_to @cryptolist, notice: 'Cryptolist was successfully created.' }
        format.json { render :show, status: :created, location: @cryptolist }
      else
        format.html { render :new }
        format.json { render json: @cryptolist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cryptolists/1
  # PATCH/PUT /cryptolists/1.json
  def update
    respond_to do |format|
      if @cryptolist.update(cryptolist_params)
        format.html { redirect_to @cryptolist, notice: 'Cryptolist was successfully updated.' }
        format.json { render :show, status: :ok, location: @cryptolist }
      else
        format.html { render :edit }
        format.json { render json: @cryptolist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cryptolists/1
  # DELETE /cryptolists/1.json
  def destroy
    @cryptolist.destroy
    respond_to do |format|
      format.html { redirect_to cryptolists_url, notice: 'Cryptolist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cryptolist
      @cryptolist = Cryptolist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cryptolist_params
      params.require(:cryptolist).permit(:symbol, :user_id, :cost_per, :amount_owned)
    end
end
