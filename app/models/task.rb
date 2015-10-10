class Task < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ""
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/


  def set_task(user)
    self.update(assigned_user_id: user.id)
  end
end
