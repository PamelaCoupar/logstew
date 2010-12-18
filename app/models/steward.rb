class Steward
 include Mongoid::Document
 include Mongoid::Timestamps
  embeds_many :logs
  embeds_one  :address
  field :cc_opt_in
  field :elder
  index :email, :unique => true
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
	 :recoverable, :rememberable, :trackable, :validatable

  def elder?
    !elder.nil? && elder
  end
end
