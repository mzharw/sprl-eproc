# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin_all_from "app/javascript/src", under: 'src', to: 'src'
pin "popper", to: 'popper.js', preload: true
pin "bootstrap", to: 'bootstrap.min.js', preload: true
pin "apexcharts" # @3.44.0
pin "jquery" # @3.7.1
pin "activestorage", to: "activestorage.esm.js"
pin "imask", to: "https://ga.jspm.io/npm:imask@7.6.0/esm/index.js"
