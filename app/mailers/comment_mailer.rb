class CommentMailer < ActionMailer::Base
  default from: "from@example.com"

  def publish_comment_email(article_user_id, comment_user)
    @url  = articles_path
    @comment_user = comment_user
    @article_user = User.where(:id => article_user_id).first
    mail(to: @article_user.email, subject: 'Comment on your article')
  end
end
