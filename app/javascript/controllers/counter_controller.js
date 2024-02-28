import {Controller} from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ['counter', 'multiplier', 'multiplicand'];

    connect() {
        this.counterTarget.readOnly = true
        this.counterTarget.default = 0
        this.multiplierTarget.default = 0
        this.multiplicandTarget.default = 0
    }

    updateCounter(el) {
        this.counterTarget.value = this.multiplierTarget.value * this.multiplicandTarget.value
    }
}