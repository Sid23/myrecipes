module ApplicationHelper

	#method to get avatar starting from the MD5 digset of the user email. The size parameter in 80px default but can be chasen independently
	def gravatar_for(user, options = { size: 80 })
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		size = options[:size]
		#build the url where avatar is stored. parameters ar the email digset and the size
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
		image_tag(gravatar_url, alt: user.chefname, class: "img-circle")
	end
end
