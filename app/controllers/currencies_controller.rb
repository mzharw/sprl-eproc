class CurrenciesController < ApplicationController
  include Filterable
  before_action :set_currency, only: %i[ show edit update destroy ]

  # GET /currencies or /currencies.json
  def index
    @currencies = selectable(Currency, :code, :name)
    @currencies = filter(@currencies)
    @currencies = paginate(@currencies)

    respond_to do |format|
      format.html do
        authorize @currencies
      end
      format.json { render json: @currencies }
    end
  end

  # GET /currencies/1 or /currencies/1.json
  def show
  end

  # GET /currencies/new
  def new
    @currency = Currency.new
  end

  # GET /currencies/1/edit
  def edit
  end

  # POST /currencies or /currencies.json
  def create
    @currency = Currency.new(currency_params)

    respond_to do |format|
      if @currency.save
        format.html { redirect_to currency_url(@currency), notice: "Currency was successfully created." }
        format.json { render :show, status: :created, location: @currency }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @currency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /currencies/1 or /currencies/1.json
  def update
    respond_to do |format|
      if @currency.update(currency_params)
        format.html { redirect_to currency_url(@currency), notice: "Currency was successfully updated." }
        format.json { render :show, status: :ok, location: @currency }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @currency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /currencies/1 or /currencies/1.json
  def destroy
    @currency.destroy!

    respond_to do |format|
      format.html { redirect_to currencies_url, notice: "Currency was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_currency
    @currency = Currency.find(params[:id])
    authorize @currency
  end

  # Only allow a list of trusted parameters through.
  def currency_params
    params.require(:currency).permit(:code, :name, :symbol, :desc)
  end
end
