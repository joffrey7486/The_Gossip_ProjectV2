class City < ApplicationRecord
    # Présence obligatoire dans la base données
    validates :name,  presence: true
    validates :zip_code, presence: true, format: { with: /\A(([0-8][0-9])|(9[0-5])|(2[ab]))[0-9]{3}\z/, message: "Votre code postal n'est pas valide" }

    has_many :users
    has_many :gossips, through: :users
end
