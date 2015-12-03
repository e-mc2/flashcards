class Card < ActiveRecord::Base
  validates :original_text, 
            :translated_text, 
            :review_date,
            :original_translated_validation, 
            presence: true

  def original_translated_validation
    if self.original_text.strip.casecmp(self.translated_text.strip) != 0
      errors.add(:translated_text, "Оригинальный текст и перевод не должны совпадать!")
    end
  end
end
