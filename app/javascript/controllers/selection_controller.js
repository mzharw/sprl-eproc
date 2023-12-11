import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["input", "optionsList", "selectedValue", "optionsContainer", "clearSelection", "selectedInput"];

    connect() {
        this.loadOptions();
        this.toggleClearSelection();
        // this.hideOptions();

        // Add a global click event listener
        document.addEventListener("click", (event) => {
            this.handleClickOutside(event);
        });
    }

    handleClickOutside(event) {
        const isClickInside = this.element.contains(event.target);
        if (!isClickInside) {
            this.hideOptions();
        }
    }

    loadOptions(query = '') {
        fetch(this.element.dataset.optionsPath + '.json' + `?query=${query}`)
            .then((response) => response.json())
            .then((data) => {
                if (data) this.updateOptionsList(data);
            });
    }

    updateOptionsList(results) {
        const optionsList = this.optionsListTarget;
        const data = this.element.dataset;
        optionsList.innerHTML = "";
        if (results.length > 0) {
            results.forEach((result) => {
                const optionElement = document.createElement("div");
                optionElement.classList.add("selection-option");
                optionElement.textContent = result[data.text];

                optionElement.setAttribute("data-id", result[data.value]);
                optionElement.addEventListener("click", () => this.selectOption(result));

                optionsList.appendChild(optionElement);

                // Check if the option is selected and add the "active" class
                if (result[data.value] === this.selectedInputTarget.value) {
                    optionElement.classList.add("active");
                    this.selectOption(result, false);
                }
            });
        } else {
            optionsList.append('No entry found')
        }

        // optionsList.append('Showing ' + results.length + ' of ' + results.length)
    }

    filterOptions() {
        const query = this.inputTarget.value.trim();
        this.debounce(this.loadOptions(query), 300)
    }

    toggleOptions() {
        const optionsContainer = this.optionsContainerTarget;
        optionsContainer.classList.toggle("show-options");
    }

    selectOption(option, close = true) {
        this.selectedValueTarget.textContent = option[this.element.dataset.text];
        this.selectedInputTarget.value = option[this.element.dataset.value];

        // Remove the "active" class from all options
        this.optionsListTarget.querySelectorAll(".selection-option").forEach((optionElement) => {
            optionElement.classList.remove("active");
        });

        // Add the "active" class to the selected option
        const selectedOptionElement = this.optionsListTarget.querySelector(`[data-id="${option[this.element.dataset.value]}"]`);
        if (selectedOptionElement) {
            selectedOptionElement.classList.add("active");
        }
        
        if (close) this.hideOptions();
        this.toggleClearSelection();
    }

    hideOptions() {
        this.optionsContainerTarget.classList.remove("show-options");
    }

    toggleClearSelection() {
        const clearSelectionIcon = this.clearSelectionTarget;
        const selectedValue = this.selectedValueTarget.textContent.trim();
        // clearSelectionIcon.style.display = selectedValue ? "inline-block" : "none";
        clearSelectionIcon.classList.toggle('ti-chevron-down', !selectedValue);
        clearSelectionIcon.classList.toggle('ti-x', selectedValue);
    }

    clearSelection() {
        // Remove the "active" class from all options
        this.optionsListTarget.querySelectorAll(".selection-option").forEach((optionElement) => {
            optionElement.classList.remove("active");
        });

        this.selectedValueTarget.textContent = "";
        this.selectedInputTarget.value = "";
        this.toggleClearSelection();
    }

    debounce(func, delay) {
        let timeoutId;
        return function (...args) {
            if (timeoutId) {
                clearTimeout(timeoutId);
            }
            timeoutId = setTimeout(() => {
                func.apply(this, args);
            }, delay);
        };
    }
}
