# config/initializers/solid_cable.rb
Rails.application.config.after_initialize do
  if Rails.env.production? && defined?(SolidCable::Record)
    # Use the primary DB for SolidCable
    SolidCable::Record.connects_to database: { writing: :primary, reading: :primary }
  end
end
