class User
  include Mongoid::Document
  include Mongoid::Timestamps

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  validates_presence_of :email
  validates_presence_of :encrypted_password

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  ## Confirmable
  # field :confirmation_token,   type: String
  # field :confirmed_at,         type: Time
  # field :confirmation_sent_at, type: Time
  # field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time

  ## Token authenticatable
  # field :authentication_token, type: String

  field :name, type: String
  validates_presence_of :name
  validates_length_of :name, minimum: 3, maximum: 128

  field :admin,   type: Boolean, default: false
  field :member,  type: Boolean, default: false
  field :student, type: Boolean

  field :position
  field :representative, type: Boolean
  belongs_to :company
  has_one :resume

  validates_associated :resume

  index({ email: 1 }, { unique: true, background: true })

  def nice_email
    "#{name} <#{email}>"
  end

  def initialize *args
    super
    #self[:unapproved] = true
  end

  def approve!
    remove_attribute :unapproved
  end

  def lock!
    self[:locked] = true
  end

  def unlock!
    remove_attribute :locked
  end

  def approved?
    not self[:unapproved]
  end

  def locked?
    self[:locked]
  end

  def active_for_authentication?
    super && approved? && !locked?
  end

  def inactive_message
    if not approved?
      :not_approved
    elsif locked?
      :locked
    else
      super # Use whatever other message
    end
  end

  def company_member?
    not company.nil?
  end

  class << self
    def admins
      where admin: true
    end

    def students
      where student: true
    end
  end
end
