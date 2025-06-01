import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
document.addEventListener("DOMContentLoaded", function() {
    const activeTab = document.getElementById("active-tab");
    if (activeTab) {
      const tabId = activeTab.value;
      const tabButton = document.querySelector(`#${tabId}-tab`);
      if (tabButton) {
        const tab = new bootstrap.Tab(tabButton);
        tab.show();
      }
    }
  });
  