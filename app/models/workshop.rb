class Workshop
  include Mongoid::Document
  include ActiveModel::Serializers::JSON

  has_many :skills
  belongs_to :officer, class_name: 'Member', inverse_of: :offices
  has_and_belongs_to_many :experts, class_name: 'Member', inverse_of: :expertises
  has_and_belongs_to_many :allowed_members, class_name: 'Member', inverse_of: :allowed_workshops

  field :name, type: String
  field :accesspoints

  accepts_nested_attributes_for :skills, allow_destroy: true,  :reject_if => proc { |attributes| attributes['name'].blank? }

  validates :name, presence: :true, uniqueness: :true

  def officer=(officer_id)
    self.write_attribute(:officer, Member.find_by(id: officer_id))
    self.save
    train_fully(self.officer)
    make_expert(self.officer)
    self.officer
  end

  def make_expert(expert)
    experts << expert
  end

  def train_fully(member)
    self.skills.each do |skill|
      !member.learned_skills.include?(skill) ? (member.learned_skills << skill) : nil
    end
    !member.allowed_workshops.include?(self) ? (member.allowed_workshops << self) : nil
  end

  def retrain_all
    allowed_members.clear
    experts.each { |e| allowed_members << e }
    allowed_members << officer
  end
end
