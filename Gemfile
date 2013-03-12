source 'https://rubygems.org'

gem 'rails', '3.2.13.rc1'

group :development, :test do
  gem 'sqlite3'
end
group :production do
  gem 'pg'
end
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'zurb-foundation'
  gem 'compass-rails'
  gem 'foundicons-rails'
end

gem 'carrierwave'
gem 'mini_magick'
gem 'haml'
gem 'jquery-rails'
gem "fancybox-rails", "~> 0.2.1"

gem 'gmaps4rails'
gem "rqrcode", "~> 0.4.2" # QR codes
gem "chunky_png"

gem "thin", ">= 1.5.0"
gem "hominid", ">= 3.0.5"
gem "devise", ">= 2.2.3"
gem "cancan", ">= 1.6.8"
gem "rolify", ">= 3.2.0"
gem "simple_form", ">= 2.0.4"

group :development do
  gem "quiet_assets", ">= 1.0.1"
  gem "hub", ">= 1.10.2", :require => false
  gem "binding_of_caller", ">= 0.7.1", :platforms => [:mri_19, :rbx]
end
