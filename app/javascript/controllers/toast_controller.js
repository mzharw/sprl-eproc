import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    static values = {delay: Number};

    connect() {
        // Get the autohide duration from the data attribute or use the default value
        const delay = this.delayValue;


        const interval = delay / 100;

        // Set up the progress bar
        const progressBar = this.element.querySelector(".progress-bar");

        // Update the progress bar width at regular intervals
        const updateProgressBar = () => {
            const currentWidth = parseFloat(progressBar.style.width) || 0;
            if (currentWidth < 100) {
                progressBar.style.width = `${currentWidth + 1}%`;
                setTimeout(updateProgressBar, interval);
            } else {
                setTimeout(() => {
                    this.element.remove();
                }, 500)
            }
        };

        // Start updating the progress bar
        updateProgressBar();
    }
}