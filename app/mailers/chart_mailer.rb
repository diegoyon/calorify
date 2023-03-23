class ChartMailer < ApplicationMailer
  def share_chart(recipient, link)
    @link = link
    mail(to: recipient, subject: "Take a look at my Calories Chart")
  end
end
