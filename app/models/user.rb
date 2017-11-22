class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #associations
  has_many :authorizations, class_name: 'LaboratoriesUser'
  has_many :laboratories, through: :authorizations
  has_many :sediments
  has_many :notifications

  #validation
  validates :name, presence: true
  validates :phone_ext, presence: true
  validates :laboratories, presence: true, unless: [:admin?]
  validates :enrollment, presence: true, unless: [:admin?]
  validate :already_user_with_laboratory, on: :create

  #callbacks
  after_create :send_notification_admin

  def already_user_with_laboratory
    laboratory_ids.each do |id|
      begin
        lab = Laboratory.find(id)
        unless lab.available?
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
    super && !authorizations.where(status: :approved).empty? || admin?
  end

  def inactive_message
    if !authorizations.where(status: :approved).empty?
      :not_approved
    else
      super
    end
  end

  def approve!(lab)
    authorization = authorizations.where(laboratory: lab).first
    authorization.status = :approved
    authorization.save
  end

  def disapprove!(lab)
    authorization = authorizations.where(laboratory: lab).first
    authorization.status = :disapproved
    authorization.save
  end

  def approved?(lab)
    !authorizations.where(laboratory: lab, status: :approved).empty?
  end
end
