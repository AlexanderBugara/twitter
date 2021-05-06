module UsersHelper

  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email)
    
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    #gravatar_url = "https://secure.gravatar.com/avatar/1fdaa466cbec3badf5418269ffc5968"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end 

end
