class Game < ActiveRecord::Base
    has_many :guesses
    
    validates :number, presence: true, numericality: true #checks if its a number
end