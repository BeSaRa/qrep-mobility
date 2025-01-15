function hideElement(selector) {
	var element = document.querySelector(selector);
	if (element) {
	  element.style.display = "none";
	}
  }
  function setTransparentBackground(selector) {
	var element = document.querySelector(selector);
	if (element) {
	  element.style.backgroundColor = "transparent";
	  element.style.color = "transparent";
	}
  }

//------------the second header of the page---------
hideElement(".elementor-element-a0340f1");

// //------make a Margin for the h1-------
// var headerMarginElement = document.querySelector("div.elementor-element-0e48830");
// 	if (headerMarginElement) {
// 		headerMarginElement.style.marginTop = "70px";
// 	}
	
// ========================================= Remove main header ====================================================
hideElement("header.mkdf-mobile-header");

//=======================================================remove footer=============================================
document.querySelector("div.mkdf-footer-top-inner").remove();
document.querySelector("div.mkdf-footer-bottom-holder").remove();

//================================Remove chatbot and accessibility tools icon======================================
hideElement("button.chatbot-toggler");
hideElement("div.pojo-a11y-toolbar-toggle");
