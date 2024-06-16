import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filters"
export default class extends Controller {
  static targets = ["hidable"];

  initialize() {
    const location = document.getElementsByName("filters[location]")[0];
    if (window.screen.width < 768) {
      location.addEventListener("blur", e => {
        e.target.form.requestSubmit();
      });
    } else {
      location.addEventListener("keyup", e => {
        if (e.key === "Enter") e.target.form.requestSubmit();
      });
    }
  }

  toggle(e) {
    e.preventDefault();
    this.hidableTargets.forEach(ele => {
      ele.classList.toggle("hidden");
    });
  }
}
