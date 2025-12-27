import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    // Check if modal is already open to prevent double opening
    if (this.element.classList.contains("show")) {
      return;
    }

    this.modal = new bootstrap.Modal(this.element, {
      keyboard: false,
    });

    this.modal.show();

    // Add event listener to remove modal from DOM when hidden
    this.element.addEventListener("hidden.bs.modal", () => {
      this.element.remove();
      this.removeBackdrop();
    });
  }

  disconnect() {
    if (this.modal) {
      this.modal.hide();
    }
    this.removeBackdrop();
  }

  removeBackdrop() {
    const backdrops = document.querySelectorAll(".modal-backdrop");
    backdrops.forEach((backdrop) => backdrop.remove());
    document.body.classList.remove("modal-open");
    document.body.style.overflow = "";
    document.body.style.paddingRight = "";
  }
}
