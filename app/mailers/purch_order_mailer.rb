class PurchOrderMailer < ApplicationMailer
  def approval_notice
    @receiver = params[:receiver]
    @model = params[:model]
    assignees = @receiver[:assignees]
    creator = @receiver[:creator]
    title = @model.finished? ? 'Fully Approved' : 'Started'

    mail(to: assignees, cc: creator, subject: "#{title} Purchase Order")
  end

  def reject_notice
    @model = params[:model]
    user_ccs = User.joins(:buyer_purch_groups, :buyer_plants)
                   .where(buyer_purch_groups: { purch_group_id: @model.purch_group_id })
                   .with_any_role('Section Head User', 'Budget Controller', 'Manager of User', 'Manager SCM', 'Manager of Finance', 'General Manager')
                   .pluck(:email)
    creator = @model.creator.email
    mail(to: creator, cc: user_ccs, subject: 'Rejected Purchase Order')
  end
end
