class EarnedMembership::Requirement
  include Mongoid::Document

  store_in collection: 'earned_membership__requirement'

  belongs_to :earned_membership, class_name: 'EarnedMembership'
  has_many :terms, class_name: 'EarnedMembership::Term', dependent: :destroy, autosave: true

  field :name, type: String
  field :rollover_limit, type: Integer, default: 0
  field :target_count, type: Integer
  field :strict, type: Boolean, default: false
  field :term_length, type: Integer, default: 1

  before_create :build_first_term

  def current_term
    terms.detect { |t| !t.satisfied and t.end_date.to_i >= earned_membership.member.expiration_time.to_i }
  end

  private
  def build_first_term
    terms.push(EarnedMembership::Term.new())
  end
end