class CurrencyExchangeRatesController < ApplicationController
  before_action :set_currency_exchange_rate, only: %i[ show edit update destroy ]
  include Filterable
  include UserTrackable

  # GET /currency_exchange_rates or /currency_exchange_rates.json
  def index
    @currency_exchange_rates = selectable(CurrencyExchangeRate)
    @currency_exchange_rates = filter(@currency_exchange_rates)
    @currency_exchange_rates = paginate(@currency_exchange_rates).decorate

    respond_to do |format|
      format.html do
        authorize @currency_exchange_rates.object
      end
      format.json { render json: @currency_exchange_rates }
    end
  end

  # GET /currency_exchange_rates/1 or /currency_exchange_rates/1.json
  def show
  end

  # GET /currency_exchange_rates/new
  def new
    @currency_exchange_rate = CurrencyExchangeRate.new
  end

  # GET /currency_exchange_rates/1/edit
  def edit
  end

  # POST /currency_exchange_rates or /currency_exchange_rates.json
  def create
    @currency_exchange_rate = CurrencyExchangeRate.new({ **currency_exchange_rate_params, **tracker })

    respond_to do |format|
      if @currency_exchange_rate.save
        format.html { redirect_to currency_exchange_rate_url(@currency_exchange_rate), notice: "Currency exchange rate was successfully created." }
        format.json { render :show, status: :created, location: @currency_exchange_rate }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @currency_exchange_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /currency_exchange_rates/1 or /currency_exchange_rates/1.json
  def update
    respond_to do |format|
      if @currency_exchange_rate.update(currency_exchange_rate_params)
        format.html { redirect_to currency_exchange_rate_url(@currency_exchange_rate), notice: "Currency exchange rate was successfully updated." }
        format.json { render :show, status: :ok, location: @currency_exchange_rate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @currency_exchange_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /currency_exchange_rates/1 or /currency_exchange_rates/1.json
  def destroy
    @currency_exchange_rate.destroy!

    respond_to do |format|
      format.html { redirect_to currency_exchange_rates_url, notice: "Currency exchange rate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_currency_exchange_rate
    @currency_exchange_rate = CurrencyExchangeRateDecorator.new(CurrencyExchangeRate.find(params[:id]))
    authorize @currency_exchange_rate
  end

  # Only allow a list of trusted parameters through.
  def currency_exchange_rate_params
    params.require(:currency_exchange_rate).permit(:from_currency_id, :from_amount, :to_currency_id, :to_amount, :from_time, :thru_time, :created_by_id, :updated_by_id, :issuer)
  end
end
