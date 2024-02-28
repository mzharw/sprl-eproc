import {Controller} from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["input", "optionsList", "selectedValue", "optionsContainer", "clearSelection", "selectedInput"];

    connect() {
        this.loadOptions('', this.element, {
            selected: true
        })
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

    loadOptions(query = '', target = this.element, options = {}) {
        const selectedInputTarget = target.querySelector('.selected-input') ?? this.selectedInputTarget;
        let selected = options.selected ?? false;
        let dependent = options.dependent ?? false;

        if (!selectedInputTarget.value) selected = false

        let filters = options.filters ?? {}
        let dataOptions = JSON.parse(target.dataset.options);
        let cascade_to = dataOptions.cascade_to;
        if (cascade_to && !selectedInputTarget.value) document.getElementById(cascade_to).classList.add('disabled');

        let path = target.dataset.optionsPath + '.json';

        let firstUsed = false
        let filterKeys = Object.keys(filters);
        for (let i = 1; i <= 3; i++) {
            if (query && i === 1) {
                path += `?query=${query}`
                firstUsed = true
                continue;
            }
            let char = firstUsed ? '&' : '?';
            if (selected && i === 2) {
                path += char;
                if (!firstUsed) firstUsed = true
                path += `id=${selectedInputTarget.value}`;
                continue
            }

            if (filterKeys.length > 0 && i === 3) {
                filterKeys.forEach((k) => {
                    path += char;
                    if (!firstUsed) firstUsed = true
                    path += `${k}=${filters[k]}`
                })
            }
        }


        if (!this.element.classList.contains('disabled')) {
            fetch(path)
                .then((response) => response.json())
                .then((result) => {
                    result.pagination = result.pagination ?? null;
                    let pagination = result.pagination

                    if (result) this.updateOptionsList(pagination ? result.data : result, target, pagination, selected, dependent);
                })
        }
    }

    generateLabel(data, source, element, inputTarget = null) {
        let text = source[data.text]
        let inputVal = text
        if (!!data.desc) {
            let desc = ` - ${source[data.desc]}`;
            let label = document.createElement('b')
            label.textContent = text;
            element.textContent = '';
            element.append(label);
            element.append(desc);
            inputVal += desc;
        } else {
            element.textContent = source[data.text];
        }

        if (inputTarget) inputTarget.value = inputVal;
    }

    updateOptionsList(results, target, pagination = null, selected = false, dependent = false) {
        const optionsList = target.querySelector('.options-list') ?? this.optionsListTarget;
        const selectedInputTarget = target.querySelector('.selected-input') ?? this.selectedInputTarget;
        const inputTarget = selected || dependent ? target.querySelector('.selection-search') ?? this.inputTarget : null;
        const optionsContainer = target.querySelector('.options-container') ?? this.optionsContainer;
        const data = target.dataset ?? this.element.dataset;

        optionsList.innerHTML = "";
        if (results.length > 0) {
            results.forEach((result) => {

                const optionElement = document.createElement("div");
                optionElement.classList.add("selection-option");
                this.generateLabel(data, result, optionElement, inputTarget)

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
        let cascadeTo = options.cascade_to
        let dependentOn = options.dependent_on
        let dependent = document.getElementById(dependentOn)
        let inputTarget = dependent ? dependent.querySelector('.selection-search') ?? this.inputTarget : null;

        this.generateLabel(data, option, selectedValueTarget, inputTarget)
        if (!selectedInputTarget.value) selectedInputTarget.value = option[data.value];


        if (dependent) {
            let dependentSelectedInput = dependent.querySelector('.selected-input');
            dependentSelectedInput.value = option[dependentOn]
            this.loadOptions('', dependent, {
                dependent: true,
                selected: true
            })
        }

        if (close && cascadeTo && !!option[data.value]) {
            const target = document.getElementById(cascadeTo);
            target.classList.remove('disabled')

            if (target) {
                this.clearOptions(target)
                this.toggleClearSelection(target)
                this.loadOptions('', target, {
                    filters: {
                        [this.element.id]: option[data.value]
                    }
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
        let cascadeTo = options.cascade_to

        if (cascadeTo) {
            const target = document.getElementById(cascadeTo);
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

}
