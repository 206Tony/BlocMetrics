if Rails.env.production? || Rails.env.development?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address: 'smtp.sendgrid.net',
    port: '587',
    user_name: ENV['SENDGRID_USERNAME'],
    password: ENV['SENDGRID_PASSWORD'], 
    domain: ' https://blooming-tor-73925.herokuapp.com/',
    authentication: :plain,
    enable_starttls_auto: true
  }  
end