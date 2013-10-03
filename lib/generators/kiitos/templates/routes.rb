
  # This line mounts Kiitos routes at /Kiitos by default.
  # This means, any requests to the /Kiitos URL of your application
  # will go to Kiitos::home#index.
  # If you would like to change where this extension is mounted,
  # simply change the :at option to something different.
  # We ask that you don't use the :as option here, as Forem
  # relies on it being the default of "Kiitos"
  mount Kiitos::Engine, :at => '/kiitos'

