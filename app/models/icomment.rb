class Icomment < ActiveRecord::Base
  belongs_to :issue

  #获得动态头像
  def user_avatar
    gravatar_id = Digest::MD5.hexdigest(self.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=512&d=retro"
  end
end
