class Sponsor < ActiveRecord::Base
  ## constants
  KIND = {
    'anonymous' => I18n.t('enum.sponsor.kind.anonymous'),
    'public' => I18n.t('enum.sponsor.kind.public')
  }

  ## validations
  validates :name, presence: true
  validates :alias, :name, length: { maximum: 200 }
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
  validates :kind, presence: true, inclusion: { in: KIND.keys }
  validates :alias, presence: true, if: Proc.new{ |o| o.kind == 'anonymous' }
  validates :description, presence: true, if: Proc.new{ |o| o.amount.zero? }
  validates :priority, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  ## scopes
  scope :active, where(active: true)

  ## methods
  def visible_name
    return self[:alias] if kind == 'anonymous'
    name
  end
end
