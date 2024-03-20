import {Controller} from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ['toggler'];

    connect() {
        let togglerHide = document.querySelectorAll('.toggler-hide')

        togglerHide.forEach(e => {
            if (e.checked) this.switch(e.dataset.hide, false)
        })
    }

    show(event) {
        const data = event.target.dataset;
        this.switch(data.show, true);

        if (data.hide) this.hide(event)
    }

    hide(event) {
        const data = event.target.dataset;
        this.switch(data.hide, false);

        if (data.show) this.show(event)
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
