class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_secure_password
  after_destroy :ensure_an_admin_remains



  private
  def ensure_an_admin_remains
    # нельзя удалить последнего пользователя
    if User.count.zero?
      raise "Последний пользователь не может быть удален"
    end
  end


end
