class User < ActiveRecord::Base

  ##
  # Modules
  #

  include Typus::Orm::ActiveRecord::User::InstanceMethods

  ##
  # Validations
  #

  validates :name, :presence => true, :uniqueness => true

  ##
  # Associations
  #

  has_many :projects, :dependent => :destroy
  has_many :featured_projects, :conditions => "name LIKE '%featured%'", :class_name => 'Project', :dependent => :destroy
  has_many :third_party_projects, :through => :project_collaborators, :dependent => :destroy

end
