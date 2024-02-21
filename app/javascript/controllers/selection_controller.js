import {Controller} from "@hotwired/stimulus";

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

    loadOptions(query = '', target = this.element, filters = {}) {
        let options = JSON.parse(target.dataset.options);
        let cascade_to = options.cascade_to;
        if (cascade_to && !this.selectedInputTarget.value) document.getElementById(cascade_to).classList.add('disabled');

        let path = target.dataset.optionsPath + '.json' + `?query=${query}`;
        let filterKeys = Object.keys(filters);
        if (filterKeys.length > 0) {
            filterKeys.forEach((k) => {
                path += `&${k}=${filters[k]}`
            })
        }

        if (!this.element.classList.contains('disabled')) {
            fetch(path)
                .then((response) => response.json())
                .then((result) => {
                    result.pagination = result.pagination ?? null;
                    let pagination = result.pagination

                    if (result) this.updateOptionsList(pagination ? result.data : result, target, pagination);
                })
        }
    }

    generateLabel(data, source, element) {
        if (!!data.desc) {
            const label = document.createElement('b')
            label.textContent = source[data.text]
            element.textContent = ''
            element.append(label)
            element.append(` - ${source[data.desc]}`);
        } else {
            element.textContent = source[data.text];
        }
    }

    updateOptionsList(results, target, pagination = null) {
        const optionsList = target.querySelector('.options-list') ?? this.optionsListTarget;
        const selectedInputTarget = target.querySelector('.selected-input') ?? this.selectedInputTarget;
        const optionsContainer = target.querySelector('.options-container') ?? this.optionsContainer;
        const data = target.dataset ?? this.element.dataset;
        // const options = target.options

        optionsList.innerHTML = "";
        if (results.length > 0) {
            results.forEach((result) => {

                const optionElement = document.createElement("div");
                optionElement.classList.add("selection-option");
                this.generateLabel(data, result, optionElement)

                optionElement.setAttribute("data-id", result[data.value]);
                optionElement.addEventListener("click", () => this.selectOption(result, target));

                optionsList.appendChild(optionElement);

                // Check if the option is selected and add the "active" class
                if (result[data.value] === selectedInputTarget.value) {
                    optionElement.classList.add("active");
                    this.selectOption(result, target, false);
                }
            });
        } else {
            optionsList.append('No entry found')
        }

        let detail = optionsContainer.querySelector('.selection-detail');
        let detailEl = document.createElement('div')
        detailEl.classList.add("selection-detail")

        let count = results.length;
        let totalCount = pagination ? pagination.total_counts : count;
        detailEl.append('Showing ' + count + ' of ' + totalCount)

        if (!!detail) {
            detail.replaceWith(detailEl)
        } else {
            optionsContainer.append(detailEl)
        }
    }

    filterTimeout = null;

    filterOptions() {
        const query = this.inputTarget.value.trim();
        let func = this.loadOptions
        let context = this
        clearTimeout(this.filterTimeout)
        this.filterTimeout = setTimeout(function () {
            func.apply(context, [query]);
        }, 300);

    }

    toggleOptions() {
        if (!this.element.classList.contains('disabled')) {
            const optionsContainer = this.optionsContainerTarget;
            optionsContainer.classList.toggle("show-options");
        }
    }

    selectOption(option, target, close = true) {
        const optionsListTarget = target.querySelector('.options-list') ?? this.optionsListTarget;
        const selectedValueTarget = target.querySelector('.selected-value') ?? this.selectedValueTarget;
        const selectedInputTarget = target.querySelector('.selected-input') ?? this.selectedInputTarget;
        const optionsContainerTarget = target.querySelector('.options-container') ?? this.optionsContainerTarget;

        const data = target.dataset;
        let options = JSON.parse(data.options);
        let cascade_to = options.cascade_to

        this.generateLabel(data, option, selectedValueTarget)
        selectedInputTarget.value = option[data.value];

        if (close && cascade_to && !!option[data.value]) {
            const target = document.getElementById(cascade_to);
            target.classList.remove('disabled')

            if (target) {
                this.clearOptions(target)
                this.toggleClearSelection(target)
                this.loadOptions('', target, {
                    [this.element.id]: option[data.value]
                })
            }
        }

        // Remove the "active" class from all options
        optionsListTarget.querySelectorAll(".selection-option").forEach((optionElement) => {
            optionElement.classList.remove("active");
        });

        // Add the "active" class to the selected option
        const selectedOptionElement = optionsListTarget.querySelector(`[data-id="${option[data.value]}"]`);
        if (selectedOptionElement) {
            selectedOptionElement.classList.add("active");
        }

        if (close) this.hideOptions(optionsContainerTarget);
        this.toggleClearSelection(target);
    }

    hideOptions(target = null) {
        (target || this.optionsContainerTarget).classList.remove("show-options");
    }

    clearSelection() {
        this.clearOptions();
        this.toggleClearSelection();

        const data = this.element.dataset;
        let options = JSON.parse(data.options);
        let cascade_to = options.cascade_to

        if (cascade_to) {
            const target = document.getElementById(cascade_to);
            if (!this.selectedInputTarget.value) target.classList.add('disabled');
            this.clearOptions(target)
            this.toggleClearSelection(target);
        }
    }

    clearOptions(target = null) {
        const optionsListTarget = target?.querySelector('.options-list') ?? this.optionsListTarget;
        const selectedValueTarget = target?.querySelector('.selected-value') ?? this.selectedValueTarget;
        const selectedInputTarget = target?.querySelector('.selected-input') ?? this.selectedInputTarget;

        // Remove the "active" class from all options
        optionsListTarget.querySelectorAll(".selection-option").forEach((optionElement) => {
            optionElement.classList.remove("active");
        });

        selectedValueTarget.textContent = "";
        selectedInputTarget.value = "";
    }

    toggleClearSelection(target = null) {
        const clearSelectionIcon = target?.querySelector('.selection-clear') || this.clearSelectionTarget;
        const selectedValue = (target ? target.querySelector('.selected-value').textContent : this.selectedValueTarget.textContent).trim();
        clearSelectionIcon.classList.toggle('ti-chevron-down', !selectedValue);
        clearSelectionIcon.classList.toggle('ti-x', selectedValue);
    }


    // debounce(func, delay) {
    //     let timeoutId;
    //     return function (...args) {
    //         if (timeoutId) {
    //             clearTimeout(timeoutId);
    //         }
    //         timeoutId = setTimeout(() => {
    //             func.apply(this, args);
    //         }, delay);
    //     };
    // }
}
