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
        let value = this.parse(this.multiplierTarget.value) * this.parse(this.multiplicandTarget.value)
        if (this.counterTarget.type == 'text') {
            value = value.toLocaleString(undefined, {
                style: 'decimal',
                minimumFractionDigits: 2,
                maximumFractionDigits: 2
            })
        }

        this.counterTarget.value = value
    }

    parse(value) {
        return parseFloat((value).replace(/,/g, ''))
    }
}