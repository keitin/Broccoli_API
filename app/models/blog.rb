class Blog < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :materials
  has_many :images, ->{ order("order DESC") }
  mount_uploader :image, ImageUploader

  def self.save_blog(params)
    title = params[:title]
    sentence = params[:sentence]
    user_id = params[:user_id]

    text_hashes = to_text_hashes(params)
    image_hashes = to_image_hashes(params)

    blog = Blog.create(title: title, sentence: sentence, image: image_hashes.first[:image], user_id: user_id)

    blog.save_images(image_hashes)
    blog.save_texts(text_hashes)

    return blog
  end

  def self.to_text_hashes(params)
    texts  = params.select {|item| item.include?("text") }
    text_hashes = []
    texts.each do |text|
      order = text[0].split("-")[0].to_i
      sentence = text[1]
      text_hashes.push({order: order, sentence: sentence})
    end
    return text_hashes
  end

  def self.to_image_hashes(params)
    images = params.select {|item| item.include?("image") }
    image_hashes = []
    images.each do |image|
      order = image[0].split("-")[0].to_i
      image = image[1]
      image_hashes.push({order: order, image: image})
    end
    image_hashes.sort! { |a, b| a[:num] <=> b[:num] }
    return image_hashes
  end

  def save_images(images)
    images.each do |image_hash|
      Image.create(image: image_hash[:image], order: image_hash[:order], blog_id: self.id)
    end
  end

  def save_texts(texts)
    texts.each do |text_hash|
      Text.create(sentence: text_hash[:sentence], order: text_hash[:order], blog_id: self.id)
    end
  end
end
