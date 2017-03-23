/**
 * main.js
 * http://www.codrops.com
 *
 * Licensed under the MIT license.
 * http://www.opensource.org/licenses/mit-license.php
 *
 * Copyright 2014, Codrops
 * http://www.codrops.com
 */

 $( document ).on('turbolinks:load', function() {
 		if($(".home").length > 0){
 			(function() {

	 	var bodyEl = document.body,
	 		content = document.querySelector( '.home' ),
	 		openbtn = document.getElementById( 'open-button' ),
	 		closebtn = document.getElementById( 'close-button' ),
	 		isOpen = false;

	 	function init() {
	 		initEvents();
	 	}

	 	function initEvents() {
	 		openbtn.addEventListener( 'click', toggleMenu );
	 		if( closebtn ) {
	 			closebtn.addEventListener( 'click', toggleMenu );
	 		}

	 		// close the menu element if the target it´s not the menu element or one of its descendants..
	 		content.addEventListener( 'click', function(ev) {
	 			var target = ev.target;
	 			if( isOpen && target !== openbtn ) {
	 				toggleMenu();
	 			}
	 		} );
	 	}

	 	function toggleMenu() {
	 		if( isOpen ) {
	 			classie.remove( bodyEl, 'show-menu' );
        if($('#login-sign-up-links').length > 0){
          $('#login-sign-up-links').fadeTo( "slow", 1 );
        }
	 		}
	 		else {
	 			classie.add( bodyEl, 'show-menu' );
        if($('#login-sign-up-links').length > 0){
          $('#login-sign-up-links').fadeTo( "slow", 0 );
        }
	 		}
	 		isOpen = !isOpen;
	 	}

	 	init();

	 })();

 		}

 });
