class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #associations
  has_many :laboratories
  has_many :sediments
  has_many :notifications

  #validation
  validates :name, presence: true
  validates :phone_ext, presence: true
  validates :laboratories, presence: true, unless: [:admin?]
  validates :enrollment, presence: true, unless: [:admin?]
  validate :already_user_with_laboratory
  #callbacks
  after_create :send_notification_admin

  def already_user_with_laboratory
    laboratory_ids.each do |id|
      begin
        unless Laboratory.find(id).user.blank?
          self.errors.add(:already_user_with_laboratory, 'Já existe outro facilitador com o laboratório')
        end
      rescue
        self.errors.add(:invalid_laboratory, 'Laboratório invalido')
      end
    end
  end

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
