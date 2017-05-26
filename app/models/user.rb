class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #associations
  belongs_to :laboratory, optional: true
  has_many :sediments
  has_many :notifications

  #validation
  validates :name, presence: true
  validates :phone_ext, presence: true
  validates :laboratory, presence: true, unless: [:admin?]

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

  def approve!
    self.approved = true
    self.save
  end

  def disapprove!
    self.approved = false
    self.save
  end
end
