import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static get targets() {
    return ['mainNav'];
  }

  toggleMobileNav() {
    this.mainNavTarget.classList.toggle('opacity-0');
    this.mainNavTarget.classList.toggle('opacity-100');
    this.mainNavTarget.classList.toggle('hidden');
  }
}
