# encoding: utf-8
require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require(*Rails.groups(:assets => %w(development test)))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module SpdyDemo
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Custom directories with classes and modules you want to be autoloadable.
    # config.autoload_paths += %W(#{config.root}/extras)

    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named.
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

    # Activate observers that should always be running.
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    # Enable escaping HTML in JSON.
    config.active_support.escape_html_entities_in_json = true

    # Use SQL instead of Active Record's schema dumper when creating the database.
    # This is necessary if your schema can't be completely dumped by the schema dumper,
    # like if you have constraints or database-specific column types
    # config.active_record.schema_format = :sql

    # Enforce whitelist mode for mass assignment.
    # This will create an empty whitelist of attributes available for mass-assignment for all models
    # in your app. As such, your models will need to explicitly whitelist or blacklist accessible
    # parameters by using an attr_accessible or attr_protected declaration.
    config.active_record.whitelist_attributes = true

    # Enable the asset pipeline
    config.assets.enabled = true

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'

    require 'associated_content'
    config.middleware.use Rack::AssociatedContent
  end
end

$FLAGS = ["Afghanistan.png", "Albania.png", "Algeria.png", "American_Samoa.png", "Andorra.png", "Angola.png", "Anguilla.png", "Antigua_and_Barbuda.png", "Argentina.png", "Armenia.png", "Aruba.png", "Australia.png", "Austria.png", "Azerbaijan.png", "Bahamas.png", "Bahrain.png", "Bangladesh.png", "Barbados.png", "Belarus.png", "Belgium.png", "Belize.png", "Benin.png", "Bermuda.png", "Bhutan.png", "Bolivia.png", "Bosnia.png", "Botswana.png", "Brazil.png", "British_Virgin_Islands.png", "Brunei.png", "Bulgaria.png", "Burkina_Faso.png", "Burundi.png", "Cambodia.png", "Cameroon.png", "Canada.png", "Cape_Verde.png", "Cayman_Islands.png", "Central_African_Republic.png", "Chad.png", "Chile.png", "China.png", "Christmas_Island.png", "Colombia.png", "Comoros.png", "Cook_Islands.png", "Costa_Rica.png", "Côte_d'Ivoire.png", "Croatia.png", "Cuba.png", "Cyprus.png", "Czech_Republic.png", "Democratic_Republic_of_the_Congo.png", "Denmark.png", "Djibouti.png", "Dominica.png", "Dominican_Republic.png", "Ecuador.png", "Egypt.png", "El_Salvador.png", "Equatorial_Guinea.png", "Eritrea.png", "Estonia.png", "Ethiopia.png", "Falkland_Islands.png", "Faroe_Islands.png", "Fiji.png", "Finland.png", "France.png", "French_Polynesia.png", "Gabon.png", "Gambia.png", "Georgia.png", "Germany.png", "Ghana.png", "Gibraltar.png", "Greece.png", "Greenland.png", "Grenada.png", "Guam.png", "Guatemala.png", "Guinea.png", "Guinea_Bissau.png", "Guyana.png", "Haiti.png", "Honduras.png", "Hong_Kong.png", "Hungary.png", "Iceland.png", "India.png", "Indonesia.png", "Iran.png", "Iraq.png", "Ireland.png", "Israel.png", "Italy.png", "Jamaica.png", "Japan.png", "Jordan.png", "Kazakhstan.png", "Kenya.png", "Kiribati.png", "Kuwait.png", "Kyrgyzstan.png", "Laos.png", "Latvia.png", "Lebanon.png", "Lesotho.png", "Liberia.png", "Libya.png", "Liechtenstein.png", "Lithuania.png", "Luxembourg.png", "Macao.png", "Macedonia.png", "Madagascar.png", "Malawi.png", "Malaysia.png", "Maldives.png", "Mali.png", "Malta.png", "Marshall_Islands.png", "Martinique.png", "Mauritania.png", "Mauritius.png", "Mexico.png", "Micronesia.png", "Moldova.png", "Monaco.png", "Mongolia.png", "Montserrat.png", "Morocco.png", "Mozambique.png", "Myanmar.png", "Namibia.png", "Nauru.png", "Nepal.png", "Netherlands.png", "Netherlands_Antilles.png", "New_Zealand.png", "Nicaragua.png", "Niger.png", "Nigeria.png", "Niue.png", "Norfolk_Island.png", "North_Korea.png", "Norway.png", "Oman.png", "Pakistan.png", "Palau.png", "Panama.png", "Papua_New_Guinea.png", "Paraguay.png", "Peru.png", "Philippines.png", "Pitcairn_Islands.png", "Poland.png", "Portugal.png", "Puerto_Rico.png", "Qatar.png", "Republic_of_the_Congo.png", "Romania.png", "Russian_Federation.png", "Rwanda.png", "Saint_Kitts_and_Nevis.png", "Saint_Lucia.png", "Saint_Pierre.png", "Saint_Vicent_and_the_Grenadines.png", "Samoa.png", "San_Marino.png", "Sao_Tomé_and_Príncipe.png", "Saudi_Arabia.png", "Senegal.png", "Serbia_and_Montenegro.png", "Seychelles.png", "Sierra_Leone.png", "Singapore.png", "Slovakia.png", "Slovenia.png", "Soloman_Islands.png", "Somalia.png", "South_Africa.png", "South_Georgia.png", "South_Korea.png", "Soviet_Union.png", "Spain.png", "Sri_Lanka.png", "Sudan.png", "Suriname.png", "Swaziland.png", "Sweden.png", "Switzerland.png", "Syria.png", "Taiwan.png", "Tajikistan.png", "Tanzania.png", "Thailand.png", "Tibet.png", "Timor-Leste.png", "Togo.png", "Tonga.png", "Trinidad_and_Tobago.png", "Tunisia.png", "Turkey.png", "Turkmenistan.png", "Turks_and_Caicos_Islands.png", "Tuvalu.png", "UAE.png", "Uganda.png", "Ukraine.png", "United_Kingdom.png", "United_States_of_America.png", "Uruguay.png", "US_Virgin_Islands.png", "Uzbekistan.png", "Vanuatu.png", "Vatican_City.png", "Venezuela.png", "Vietnam.png", "Wallis_and_Futuna.png", "Yemen.png", "Zambia.png", "Zimbabwe.png"]

$SUB_FLAGS = $FLAGS[0,45] + ["Taiwan.png"] + $FLAGS[0,45]
