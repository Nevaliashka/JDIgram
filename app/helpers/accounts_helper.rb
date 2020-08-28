module AccountsHelper

  def profile_picture account, width = 50
    image_path = account.image.present? ? account.image.url : "default.png"
    image_tag(image_path, width: width, height: width, class: "profile-pic m-r-10")
  end

end

