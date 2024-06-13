import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["menu"];

  toggle(e) {
    e.preventDefault();
    this.menuTarget.classList.toggle("scale-x-100");
    this.menuTarget.classList.toggle("scale-x-0");
    document.querySelector("body").classList.toggle("overflow-y-hidden")
  }
}
