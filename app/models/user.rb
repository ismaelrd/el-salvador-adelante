class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## constants
  ROLES = %w(admin guest)

  ## validations
  validates :first_name, :last_name, :role, presence: true
  validates :first_name, :last_name, length: { maximum: 200 }
  validates :role, inclusion: { in: ROLES }

  ## associations
  has_many :posts, dependent: :destroy

  ## methods
  def full_name
    [first_name, last_name].join(', ')
  end
end
