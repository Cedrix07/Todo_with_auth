// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


document.addEventListener("DOMContentLoaded", function() {
    document.getElementById('due_date').min = new Date().toISOString().split('T')[0];
});


