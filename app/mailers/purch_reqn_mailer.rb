class PurchReqnMailer < ApplicationMailer

  def approval_notice
    @receiver = params[:receiver]
    @model = params[:model]
    title = @model.finished? ? 'Fully Approved' : 'Started'
    mail(to: 'mazhariwirasena@gmail.com', cc: 'acc.ma.g7@gmail.com', subject: "#{title} Purchase Requisition")
  end

  def reject_notice
    @model = params[:model]
    mail(to: 'mazhariwirasena@gmail.com', cc: 'acc.ma.g7@gmail.com', subject: 'Rejected Purchase Requisition')
  end

end
