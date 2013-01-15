#IntegracaoIME::Application.configure do
Rails.application.config do
  config.middleware.swap(
    ActionDispatch::ShowExceptions,
    ActionDispatch::ShowExceptions,
    ActionDispatch::PublicExceptions.new(
      Rails.root.join('public/assets')
    )
  )
end
