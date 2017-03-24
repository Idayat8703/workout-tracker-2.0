Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['1583288421699681'], ENV['2fa88b1e0e9fd0c78048c4e7f6ead06b']
end
