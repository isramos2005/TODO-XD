"use strict";
$(document).ready(() => {
    /*------- button with class register -------*/
    let reg_btn = $('.container .register');
    /*------- button with class sign in --------*/
    /*------- back button ----------------------*/
    let back_btn = $('.container .back');
    reg_btn.click(function (e) {
        e.preventDefault();
        $(this).siblings('.reg').css({
            'transform': 'translateY(40%) scale(2)',
            'border-radius': '0',
            'width': '100%',
            'height': '100%',
            'transition':'0.5s'
        }).end();
        reg_btn.siblings('.container h3:nth-of-type(1)').css({
            'top': '40%',
            'z-index': '8',
        }).end().end();
    });

});