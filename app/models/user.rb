class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, :styles => { :original => Proc.new { |instance| instance.resize },
     # :large => "800x800#",
     :medium => "240x240#",
     # :small => "100x100#",
     :thumb => "32x32#"
     },
         default_url: 'april2.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  has_many :tasks


end
