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

//------------the calender second header of the page---------
hideElement(".elementor-element-1180a48");
//------------the videos lib second header of the page---------
hideElement(".elementor-element-748e70b");
// ========================================= Remove main header ====================================================
hideElement("header.mkdf-mobile-header");

//=======================================================remove footer=============================================
document.querySelector("div.mkdf-footer-top-inner").remove();
document.querySelector("div.mkdf-footer-bottom-holder").remove();

//================================Remove chatbot and accessibility tools icon======================================
hideElement("button.chatbot-toggler");
hideElement("div.pojo-a11y-toolbar-toggle");
