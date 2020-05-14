class Ticket < ActiveRecord::Base
  validates :status, inclusion: { in: %w(new blocked in_progress ),
                                  message: "%{value} not a valid status." }

  has_many :ticket_tags
  has_many :tags, through: :ticket_tags
  has_many :comments, dependent: :destroy
  belongs_to :project
  belongs_to :creator, foreign_key: 'creator_id', class_name: 'User'
  belongs_to :assignee, foreign_key: 'assignee_id', class_name: 'User', optional: true
end