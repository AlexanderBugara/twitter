module UsersHelper

  def gravatar_for(user, options = { size: 50 } )
    size = options[:size]
    gravatar_id = Digest::MD5::hexdigest(user.email)
    
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    #gravatar_url = "https://secure.gravatar.com/avatar/1fdaa466cbec3badf5418269ffc5968"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end 

end
