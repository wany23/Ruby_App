class User
  include Mongoid::Document

  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :role, type: String
  field :description, type: String
  field :urls, type: Hash
  after_initialize :init

  has_and_belongs_to_many :courses 

  validates :email, :presence => true, :uniqueness => true

  def init
  	self.role ||= 'Student'
    self.urls ||= {}
  end

  def addUrl(name, url)
    update_attribute :urls, urls.merge(name => url)
  end
  
end
