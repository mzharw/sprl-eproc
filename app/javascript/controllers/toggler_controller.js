import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ['toggler'];

    show(event) {
        const data = event.target.dataset;
        this.switch(data.show, true);
    }

    hide(event) {
        const data = event.target.dataset;
        this.switch(data.hide, false);
    }

    switch(target, action) {
        document.querySelectorAll(`.${target}`).forEach((el) => {
            if (action) {
                el.classList.remove('d-none');
                // Disable all input elements inside the selected element
                el.querySelectorAll('input').forEach(input => {
                    input.disabled = false;
                });
            } else {
                el.classList.add('d-none');
                // Enable all input elements inside the selected element
                el.querySelectorAll('input').forEach(input => {
                    input.disabled = true;
                });
            }
        });
    }

}
