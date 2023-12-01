# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin "jquery"
pin_all_from "app/javascript/controllers", under: "controllers"
pin_all_from "app/javascript/src", under: 'src', to: 'src'
pin "popper", to: 'popper.js', preload: true
pin "bootstrap", to: 'bootstrap.min.js', preload: true
pin "apexcharts" # @3.44.0
pin "simplebar" # @6.2.5
pin "can-use-dom" # @0.1.0
pin "lodash-es" # @4.17.21
pin "simplebar-core" # @1.2.4
pin "@selectize/selectize", to: "@selectize--selectize.js" # @0.15.2
