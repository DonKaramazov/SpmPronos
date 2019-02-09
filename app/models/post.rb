class Post < ApplicationRecord
    has_many :comments,dependent: :destroy

    validates :title,presence: true
    validates :status,
            inclusion: { in: ['En ligne','Hors ligne'], message: "accepte pour valeur \"En ligne\" et \"Hors ligne\""},
            presence: true
    validates :body,presence: true
    validate :published_at_not_past


    private 

    def published_at_not_past
        if published_at.present? && published_at.past?
            errors.add(:published_at,'ne peut être dans le passé')
        end
    end
end