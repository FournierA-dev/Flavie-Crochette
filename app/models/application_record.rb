class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  $admin_mails = ["flavie.collette@live.fr","ahm.fournier@laposte.net"]
  $article_types =["Poupée tissu","Poupée crocher","Accessoire enfant","Accessoire adulte"]
  $facebook_link ="https://fr-fr.facebook.com/flavie.crochette/"
  $flavie_mail = "flavie.collette@live.fr"
end
