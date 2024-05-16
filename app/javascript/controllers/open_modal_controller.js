import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["modal"];

  connect() {
    this.show()
  }

  initialize() {
    const options = {
      placement: "center",
      backdropClasses: "bg-gray-900 bg-opacity-50 dark:bg-opacity-80 fixed inset-0 z-40",
      onShow: () => {
        document.body.classList.add("overflow-y-hidden");
        document.body.classList.remove("hidden");
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
    console.log("-------hide------")
    console.log(this.modal)
    console.log("-------hide------")

    this.modal.hide();
  }
}
