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
  }

  markAsRead(event) {
    const notificationId = event.currentTarget.dataset.notificationId;

    fetch(`/notifications/${notificationId}/mark_as_read`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector('[name="csrf-token"]').content,
      },
    }).then(() => {
      this.loadUnreadCount(); // Refresh unread count after marking as read
    });
  }
}
