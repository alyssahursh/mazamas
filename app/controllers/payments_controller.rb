class PaymentsController < ApplicationController
  def stripe
    puts "I got here!"
    AdminMailer.test("akhursh@gmail.com").deliver
    # Give Stripe confirmation that the information was received
    return status 200

  end
end
