import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = isDevelopment();
window.Stimulus   = application;

function isDevelopment() {
  return document.head.querySelector("meta[name=rails_env]").content === "development"
}

export { application }
