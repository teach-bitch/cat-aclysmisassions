// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require jquery_ujs
//= require activestorage
//= require_tree .
//= require js/core/jquery.3.2.1.min
//= require js/core/popper.min
//= require js/core/bootstrap.min
//= require js/plugins/moment.min

//= require js/plugins/bootstrap-switch
//= require js/plugins/bootstrap-tagsinput

//= require js/plugins/bootstrap-selectpicker

//= require js/plugins/jasny-bootstrap.min

//= require js/plugins/nouislider.min

//= require js/plugins/bootstrap-datetimepicker.min

//= require js/now-ui-kit

//= require js/plugins/presentation-page/rellax.min






/** define the variable that will save the panel element */
let panel;
/** define the variable that will store the computed data of panel element */
let computed_data;

setTimeout(() => {
    /** wait for the dom (document object model, document html) to be loaded  */

    panel = document.getElementById("sticky-panel");

    if (panel) {

        /** the computed data (height, width, position... ) of the panel element */
        computed_data = panel.getBoundingClientRect()
    }
}, 200)

/** Listen to document scroll event */
document.addEventListener("scroll", handle_sticky);

function handle_sticky(e) {
    if (panel) {
        /** add class sticky when we scroll over 480 */
        if (window.scrollY > 480) {
            panel.classList.add("sticky");
            /** we apply the original width (computed.width) (in a string ``) of the panel element to the sticky element (panel.style.width)*/
            panel.style.width = `${computed_data.width.toString()}px`;

            /** else remove class sticky */
        } else {

            panel.classList.remove("sticky");

        }

    }
}

window.addEventListener('beforeunload', (e) => {
    if (e.target.URL === `https://chat-perlipopette.herokuapp.com/products` || e.target.URL === "http://localhost:3000/products") {
        document.removeEventListener("scroll", handle_sticky);
        panel = null;
    }


});