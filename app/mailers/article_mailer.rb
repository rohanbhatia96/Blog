class ArticleMailer < ActionMailer::Base
  default from: "from@example.com"


  def publish_article_email(user)
    @user = user
    @url  = articles_path
    mail(to: @user.email, subject: 'your article is published')
  end
end
