import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filters"
export default class extends Controller {
  initialize() {
    const slider = new RangeSlider('.range-slider', {
      values: [1, 250],
      min: 1,
      max: 250,
      pointRadius: 8
    });

    this.lowEle = document.querySelector(".range-low");
    this.highEle = document.querySelector(".range-high");
    this.lowInput = document.getElementById("filters_price_min");
    this.highInput = document.getElementById("filters_price_max");
    
    slider.onChange(values => {
      this.lowEle.textContent = `$${values[0]}`;
      this.highEle.textContent = `$${values[1]}`;
      this.lowInput.value = values[0];
      this.highInput.value = values[1];
      this.lowInput.form.requestSubmit();
    });
  }

  reset() {
    document.querySelector(".range-slider").textContent = "";
    this.initialize();
    this.lowEle.textContent = "$1";
    this.highEle.textContent = "$250";
    this.lowInput.value = 1;
    this.highInput.value = 250;
    this.lowInput.form.requestSubmit();
  }
}
