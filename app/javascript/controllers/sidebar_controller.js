import {Controller} from '@hotwired/stimulus';

export default class extends Controller {
    connect() {
        let mainWrapper = $("#main-wrapper")
        let setsidebartype = function () {
            let width =
                window.innerWidth > 0 ? window.innerWidth : this.screen.width;
            if (width < 1199) {
                mainWrapper.attr("data-sidebartype", "mini-sidebar");
                mainWrapper.addClass("mini-sidebar");
            } else {
                mainWrapper.attr("data-sidebartype", "full");
                mainWrapper.removeClass("mini-sidebar");
            }
        };

        $(window).on('load', () => {
            setsidebartype();
        });

        document.body.classList.toggle('sidebar-open');
        $(window).on("resize", setsidebartype);
        $(".sidebartoggler").on("click", function () {
            mainWrapper.toggleClass("show-sidebar");
            // mainWrapper.toggleClass("mini-sidebar");
            if (mainWrapper.hasClass("mini-sidebar")) {
                $(".sidebartoggler").prop("checked", !0);
                mainWrapper.attr("data-sidebartype", "mini-sidebar");
            } else {
                $(".sidebartoggler").prop("checked", !1);
                mainWrapper.attr("data-sidebartype", "full");
            }
        });

        $("#sidebar-toggler").on("click", () => {
            if (mainWrapper.attr("data-sidebartype") === 'full') {
                mainWrapper.attr("data-sidebartype", "mini-sidebar");
                mainWrapper.addClass("mini-sidebar");
            } else {
                mainWrapper.attr("data-sidebartype", "full");
                mainWrapper.removeClass("mini-sidebar");
            }
        })
    }
}