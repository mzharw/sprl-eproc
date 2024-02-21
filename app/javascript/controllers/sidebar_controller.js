import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
    connect() {
        var setsidebartype = function () {
            var width =
                window.innerWidth > 0 ? window.innerWidth : this.screen.width;
            if (width < 1199) {
                $("#main-wrapper").attr("data-sidebartype", "mini-sidebar");
                $("#main-wrapper").addClass("mini-sidebar");
            } else {
                $("#main-wrapper").attr("data-sidebartype", "full");
                $("#main-wrapper").removeClass("mini-sidebar");
            }
        };
        $(window).on('load', () => {
            setsidebartype;
        });
        document.body.classList.toggle('sidebar-open');
        $(window).on("resize", setsidebartype);
        $(".sidebartoggler").on("click", function () {
            $("#main-wrapper").toggleClass("mini-sidebar");
            if ($("#main-wrapper").hasClass("mini-sidebar")) {
                $(".sidebartoggler").prop("checked", !0);
                $("#main-wrapper").attr("data-sidebartype", "mini-sidebar");
            } else {
                $(".sidebartoggler").prop("checked", !1);
                $("#main-wrapper").attr("data-sidebartype", "full");
            }
        });
        $(".sidebartoggler").on("click", function () {
            $("#main-wrapper").toggleClass("show-sidebar");
        });
    }
}