import {Controller} from "@hotwired/stimulus"

export default class extends Controller {

    connect() {
        this.makeHeaderSticky();
        this.makeColumnsSticky();
    }

    makeHeaderSticky() {
        let thead = this.element.querySelector("thead");
        let stickyColumns = this.element.querySelectorAll("th.sticky");

        if (thead.classList.contains("sticky")) {
            thead.style.position = "sticky";
            thead.style.top = 0;
            thead.style.left = 0; // prevent negative offset
            thead.classList.add("border", "rounded");
        }

        stickyColumns.forEach(column => {
            column.style.position = "sticky";

            // get accurate offset
            let offset = Math.max(column.offsetLeft + 1, 0);
            column.style.left = offset + "px";
        });
    }

    makeColumnsSticky() {
        let stickyHeaders = this.element.querySelectorAll("th.sticky");
        let rows = this.element.querySelectorAll("tbody tr");

        stickyHeaders.forEach(header => {
            let index = Array.from(header.parentElement.children).indexOf(header);
            let offset = Math.max(header.offsetLeft + 1, 0);

            rows.forEach(row => {
                let cell = row.children[index];
                if (cell) {
                    cell.style.position = "sticky";
                    cell.style.left = offset + "px";
                    cell.classList.add("sticky");
                }
            });
        });
    }
}
