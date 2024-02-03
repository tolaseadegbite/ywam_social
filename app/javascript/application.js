// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "./gallery"
// import * as bootstrap from "bootstrap"
window.bootstrap = require('bootstrap/dist/js/bootstrap.bundle.js');
window.Flickity = require('flickity');
