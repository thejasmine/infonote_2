// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'bootstrap'

Rails.start()
Turbolinks.start()
ActiveStorage.start()

//vertical tabs
require("jquery-ui")
$(function() { 
    init();
    $('#v-pills-tab a').on('click', function (e) {
        e.preventDefault()
        $(this).tab('show')        
    });    
});

function init() {
    $('#v-pills-tab a:first').tab('show')
}
/*
$(function() { 
    $('.nav-link').on('click', function(e){
        e.preventDefault()
        $('#v-pills-tab a:first').tab('show')
    })   
});*/

