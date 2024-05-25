import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["count"];

  connect() {
    this.loadUnreadCount();
    this.interval = setInterval(() => this.loadUnreadCount(), 10000); // Fetch unread count every 10 seconds
  }

  disconnect() {
    clearInterval(this.interval);
  }

  loadUnreadCount() {
    fetch("/notifications/unread_count")
      .then((response) => response.json())
      .then((data) => {
        this.updateNotificationCount(data.count);
      });
  }

  updateNotificationCount(count) {
    this.countTarget.textContent = count;
    this.countTarget.style.display = count > 0 ? "inline" : "none";
    document.getElementById("unread-notification-count").textContent = count;
  }
}
