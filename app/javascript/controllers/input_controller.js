import {Controller} from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["numberInput"];

    connect() {
        let numberInput = IMask(this.numberInputTarget, {
            mask: Number,  // enable number mask
            // other options are optional with defaults below
            scale: 2,  // digits after point, 0 for integers
            thousandsSeparator: ',',  // any single char
            padFractionalZeros: true,  // if true, then pads zeros at end to the length of scale
            normalizeZeros: true,  // appends or removes zeros at ends
            radix: '.',  // fractional delimiter
            mapToRadix: ['.'],  // symbols to process as radix
            max: this.numberInputTarget.max || null,
            min: 0,
            autofix: true,
        })
    }
}