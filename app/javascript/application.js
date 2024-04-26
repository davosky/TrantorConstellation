// Entry point for the build script in your package.json
import "@hotwired/turbo-rails";
import "./controllers";

// Bootstrap
import * as bootstrap from "bootstrap";
window.bootstrap = bootstrap;

// FontAwesome
import "@fortawesome/fontawesome-free/js/all.js";
