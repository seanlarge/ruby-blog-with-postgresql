class Blog < ActiveRecord::Base

  scope :draft, -> { where(draft_status: true)}
  scope :published, -> { where(draft_status: false)}
  scope :search, -> (search_query) { where('body LIKE ? OR subject LIKE ?', "%#{search_query}%", "%#{search_query}%") }
  validates :body, presence: true

end # end of class blog
