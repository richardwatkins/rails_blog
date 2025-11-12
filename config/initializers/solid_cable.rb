# config/initializers/solid_cable.rb
if Rails.env.production?
  # Use the default database connection for SolidCable
  SolidCable::Record.connects_to database: { writing: :primary, reading: :primary }
end

