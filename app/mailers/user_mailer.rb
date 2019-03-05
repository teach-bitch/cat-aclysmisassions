class UserMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'

  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://catpeach/login'

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez nous 8=D !')
  end

  def bill_email(facturation)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @facturation = facturation
    @user = facturation.basket.user

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://catpeach/login'
    puts "je rentre dans user_mailer.rb"
    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Nous vous remercions pour cet achat  !')
  end
end
