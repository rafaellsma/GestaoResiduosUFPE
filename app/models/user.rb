class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #associations
  has_one :laboratory
  has_many :sediments
  has_many :notifications

  #validation
  validates :name, presence: true
  validates :phone_ext, presence: true
  validates :laboratory_id, presence: true, unless: [:admin?]

  #callbacks
  after_create :send_notification_admin

  def send_notification_admin
    if !self.admin
      admins = User.where('admin = ?', true)
      admins.each do |admin|
        admin.notifications.create(message: "Nova solicitação de acesso")
      end
    end
  end

  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    if !approved?
      :not_approved
    else
      super
    end
  end
end
