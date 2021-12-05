class LittersController < ApplicationController
  before_action :set_litter, only: [:show, :edit, :update, :destroy]

  # GET /litters
  def index
    @litters = Litter.all
  end

  # GET /litters/1
  def show
  end

  # GET /litters/new
  def new
    @litter = Litter.new
  end

  # GET /litters/1/edit
  def edit
  end

  # POST /litters
  def create
    @litter = Litter.new(litter_params)

    if @litter.save
      redirect_to @litter, notice: 'Litter was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /litters/1
  def update
    if @litter.update(litter_params)
      redirect_to @litter, notice: 'Litter was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /litters/1
  def destroy
    @litter.destroy
    redirect_to litters_url, notice: 'Litter was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_litter
      @litter = Litter.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def litter_params
      params.require(:litter).permit(:litter_name, :sire_id, :bitch_id, :puppy_count, :due_date, :puppy_release_date)
    end
end
