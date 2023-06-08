class Payment < ApplicationRecord
    validates :txid, uniqueness: { message: "*****already paid" }
    validates :card,  presence: true  
end
