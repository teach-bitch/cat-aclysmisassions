class AdminMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'

  def admin_bill_email(facturation)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @facturation = facturation
    @user = facturation.basket.user
    look_for_admin = User.all

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://catpeach/login'
    puts "je rentre dans admin_mailer.rb"

    look_for_admin.each do |u|
      if u.is_admin
        @admin = u
        mail(to: u.email, subject: "Achat, client: #{@user.email}")
      end
    end

  end
end
