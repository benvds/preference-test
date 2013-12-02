class Preference < Sequel::Model
  def validate
    if value.nil? || value.empty?
      errors.add(:value, "can't be empty")
    end
  end
end
