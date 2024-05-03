class BanksController < ApplicationController
  include Filterable

  def index
    @banks = selectable(Bank.joins(:party), :code, 'parties.full_name')
    @banks = filter(@banks, { name: 'parties.full_name' }, 'banks.code', 'ASC')
    json = paginate_json(@banks.select(:id, :code, 'parties.full_name as name'))

    respond_to do |format|
      # format.html { authorize @banks.object }
      format.json { render json: }
    end
  end
end
