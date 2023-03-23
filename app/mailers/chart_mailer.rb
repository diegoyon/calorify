class ChartMailer < ApplicationMailer
  def share_chart(recipient, user)
    @user = user
    mail(to: recipient, subject: "Take a look at my calorie chart!")
  end
end
