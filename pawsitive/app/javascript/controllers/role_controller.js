import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["priceField"];

  connect() {
    this.togglePriceField();
  }

  togglePriceField() {
    console.log("togglePriceField called");
    const priceField = this.priceFieldTarget;

    // Add event listener to role select input
    this.element.querySelector("select[name='user[role]']").addEventListener("change", (event) => {
      const role = event.target.value; // Retrieve the value of the role select input

      // Update the display of the price field based on the selected role
      if (role === "member") {
        priceField.style.display = "block";
      } else {
        priceField.style.display = "none";
      }
    });

    // Initial check for role select input value
    const initialRole = this.element.querySelector("select[name='user[role]']").value;
    // Toggle price field based on initial role
    if (initialRole === "member") {
      priceField.style.display = "block";
    } else {
      priceField.style.display = "none";
    }
  }
}
