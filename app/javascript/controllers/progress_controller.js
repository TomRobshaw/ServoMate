import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="progress"
export default class extends Controller {
  static targets = ["bar"]
  static values = {
    percent: Number
  }

  connect() {
    setTimeout(() => {
      this.barTarget.style.width = `${this.percentValue}%`
    }, 1000);
  }
}
