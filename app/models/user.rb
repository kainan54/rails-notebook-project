class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :username
  validates_presence_of :email

  validates_uniqueness_of :username
  validates_uniqueness_of :email

  enum role: { reg: 0, admin: 1 }
  
  has_many :note_books

  has_many :saved_note_book_joins

  has_many :saved_note_books, through: :saved_note_book_joins, source: :note_book

  # has_many :follower_relationships, foreign_key: :followed_id, class_name: "FollowJoin"
  # has_many :followers, through: :follower_relationships, source: :following

  # has_many :following_relationships, foreign_key: :following_id, class_name: 'FollowJoin'
  # has_many :following, through: :following_relationships, source: :followed

  def self.filter_by_username(query)
    self.where("lower(username) like ?", "%#{query.downcase}%").limit(50).order(updated_at: :DESC)
  end

  def has_user_saved_note_book(note_book_id)
    note_book_id.to_i
    
    SavedNoteBookJoin.where(user_id: self.id, note_book_id: note_book_id).count != 0
  end

  def owns_note_book(note_book_id)
    note_book_id.to_i
    
    NoteBook.find(note_book_id).user.id == self.id
  end
end
