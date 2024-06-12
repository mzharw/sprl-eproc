import {Controller} from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["input", "button"];

    connect() {}

    toggle(e) {
        if (this.inputTarget.type === 'password') {
            this.buttonTarget.querySelector('.ti').classList.replace('ti-eye', 'ti-eye-off')
            this.inputTarget.type = 'text'
        } else {
            this.buttonTarget.querySelector('.ti').classList.replace('ti-eye-off', 'ti-eye')
            this.inputTarget.type = 'password'
        }
    }
}