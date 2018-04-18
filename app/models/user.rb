class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
  include UserRoles

  has_and_belongs_to_many :roles

  def token_validation_response
    UserSerializer.new( self, root: false ).as_json
  end
end
