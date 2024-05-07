class PurchOrderMailer < ApplicationMailer
  def approval_notice
    @receiver = params[:receiver]
    @model = params[:model]
    seq = @receiver[:seq]

    to = seq == 1 ? @receiver[:assignees] : [*@receiver[:creator], *User.with_role('Buyer').pluck(:email)]
    cc = seq == 1 ? @receiver[:creator] : @receiver[:assignees]
    title = @model.finished? ? 'Fully Approved' : 'Started'
    bcc = User.with_role('Super Admin').pluck(:email)

    mail(to:, cc:, bcc:, subject: "#{title} Purchase Order")
  end

  def reject_notice
    @model = params[:model]
    to = @model.creator.email
    cc = User.joins(:buyer_purch_groups, :buyer_plants)
             .where(buyer_purch_groups: { purch_group_id: @model.purch_group_id })
             .with_any_role('Section Head User', 'Budget Controller', 'Manager of User', 'Manager SCM', 'Manager of Finance', 'General Manager')
             .pluck(:email)
    bcc = User.with_role('Super Admin').pluck(:email)

    mail(to:, cc:, bcc:, subject: 'Rejected Purchase Order')
  end
end
