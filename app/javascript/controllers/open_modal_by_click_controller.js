import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["modal"];

  initialize() {
    const options = {
      placement: "center",
      backdropClasses: "bg-gray-900 bg-opacity-50 dark:bg-opacity-80 fixed inset-0 z-40",
      onShow: () => {
        document.body.classList.add("overflow-y-hidden");
      },
      onHide: () => {
        document.body.classList.remove("overflow-y-hidden");
        this.dispatch("hide");
      }
    };

    this.modal = new Modal(this.modalTarget, options);

    if (this.showValue) {
      this.show();
    }
  }

  show() {
    this.modal.show();
  }

  hide() {
    this.modal.hide();
  }
}
