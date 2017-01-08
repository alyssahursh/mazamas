class PaymentsController < ApplicationController
  def stripe
    TestMailer.test("akhursh@gmail.com").deliver_now

    # Give Stripe confirmation that the information was received
    render status: 200
  end
end
