import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

document.addEventListener('turbo:load', () => {
  const titleElement = document.querySelector('meta[name="title"]');
  if (titleElement) {
    document.title = titleElement.content;
  }
});
export { application }
