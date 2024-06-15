import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="slider"
export default class extends Controller {
  controlFromSlider(fromSlider, toSlider, fromInput) {
    const [from, to] = this.getParsed(fromSlider, toSlider);
    this.fillSlider(fromSlider, toSlider, '#CCC', '#1975d2', toSlider);
    if (from > to) {
      fromSlider.value = to;
      fromInput.textContent = `$${to}`;
    } else {
      fromInput.textContent = `$${from}`;
    }
  }
  
  controlToSlider(fromSlider, toSlider, toInput) {
    const [from, to] = this.getParsed(fromSlider, toSlider);
    this.fillSlider(fromSlider, toSlider, '#CCC', '#1975d2', toSlider);
    this.setToggleAccessible(toSlider);
    if (from <= to) {
      toSlider.value = to;
      toInput.textContent = `$${to}`;
    } else {
      toInput.textContent = `$${from}`;
      toSlider.value = from;
    }
  }
  
  getParsed(currentFrom, currentTo) {
    const from = parseInt(currentFrom.value.replace("$", ""), 10);
    const to = parseInt(currentTo.value.replace("$", ""), 10);
    return [from, to];
  }
  
  fillSlider(from, to, sliderColor, rangeColor, controlSlider) {
      const rangeDistance = to.max-to.min;
      const fromPosition = from.value - to.min;
      const toPosition = to.value - to.min;
      controlSlider.style.background = `linear-gradient(
        to right,
        ${sliderColor} 0%,
        ${sliderColor} ${(fromPosition)/(rangeDistance)*100}%,
        ${rangeColor} ${((fromPosition)/(rangeDistance))*100}%,
        ${rangeColor} ${(toPosition)/(rangeDistance)*100}%, 
        ${sliderColor} ${(toPosition)/(rangeDistance)*100}%, 
        ${sliderColor} 100%)`;
  }
  
  setToggleAccessible(currentTarget) {
    const toSlider = document.querySelector('#toSlider');
    if (Number(currentTarget.value) <= 0 ) {
      toSlider.style.zIndex = 2;
    } else {
      toSlider.style.zIndex = 0;
    }
  }

  updateInputValues(input, text) {
    input.value = text.textContent.replace("$","");
    input.form.requestSubmit();
  }
  
  initialize() {  
    this.fromSlider = document.querySelector('#fromSlider');
    this.toSlider = document.querySelector('#toSlider');
    this.fromInput = document.querySelector('#fromInput');
    this.toInput = document.querySelector('#toInput');
    this.lowInput = document.getElementById("filters_price_min");
    this.highInput = document.getElementById("filters_price_max");
    this.fillSlider(this.fromSlider, this.toSlider, '#CCC', '#1975d2', this.toSlider);
    this.setToggleAccessible(this.toSlider);
    
    this.fromSlider.oninput = () => this.controlFromSlider(this.fromSlider, this.toSlider, this.fromInput);
    this.toSlider.oninput = () => this.controlToSlider(this.fromSlider, this.toSlider, this.toInput);
    this.fromSlider.onclick = () => this.updateInputValues(this.lowInput, this.fromInput);
    this.fromSlider.addEventListener("touchend", () => {this.updateInputValues(this.lowInput, this.fromInput);});
    this.toSlider.onclick = () => this.updateInputValues(this.highInput, this.toInput);
    this.toSlider.addEventListener("touchend", () => {this.updateInputValues(this.highInput, this.toInput);});
  }

  reset() {
    this.fromInput.textContent = "$1";
    this.toInput.textContent = "$250";
    this.fromSlider.value = 1;
    this.toSlider.value = 250;
    this.lowInput.value = 1;
    this.highInput.value = 250;
    this.fillSlider(this.fromSlider, this.toSlider, '#CCC', '#1975d2', this.toSlider);
    this.setToggleAccessible(this.toSlider);
    this.lowInput.form.requestSubmit();
  }
}
