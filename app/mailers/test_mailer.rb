class TestMailer < BaseMandrillMailer
  def test(user_email)
    subject = "OH MY FUCKING GOD YOU DID IT!"
    merge_vars = {
      "NAME" => "Alyssa",
      "USER_URL" => "www.google.com",
    }
    body = mandrill_template("welcome-email", merge_vars)

    send_mail(user_email, subject, body)
  end
end
