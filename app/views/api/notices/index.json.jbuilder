json.notices @notices do |notice|
  json.notice notice
  json.user notice.user
  json.blog notice.blog
  json.blog_user notice.blog.user if notice.blog
  json.from_user notice.from_user
end