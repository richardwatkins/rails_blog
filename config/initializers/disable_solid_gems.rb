Rails.application.config.after_initialize do
  if Rails.env.production?
    [SolidCable, SolidQueue, SolidCache].each do |gem_module|
      if defined?(gem_module::Record)
        gem_module::Record.connects_to database: { writing: :primary, reading: :primary }
      end
    end
  end
end
