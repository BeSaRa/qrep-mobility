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

//------make a Margin for the h1-------
var privacyHeaderMarginElement = document.querySelector("div.elementor-element-f33f0e6");
	if (privacyHeaderMarginElement) {
		privacyHeaderMarginElement.style.marginTop = "70px";
	}
var faqHeaderMarginElement = document.querySelector(" body > div.mkdf-wrapper > div > div > div > div > div.elementor-element.elementor-element-56c42fb.e-con-full.e-flex.e-con.e-parent.e-lazyloaded > div.elementor-element.elementor-element-1ca9458.e-con-full.e-flex.e-con.e-child > div > div > div > div > h3");
	if (faqHeaderMarginElement) {
		faqHeaderMarginElement.style.marginTop = "70px";
	}
//hide the second header for FAQ
setTransparentBackground(".elementor-element-736bf2d");
hideElement("body > div.mkdf-wrapper > div > div > div > div > div.elementor-element.elementor-element-736bf2d.e-con-full.e-flex.e-con.e-child > div > div > div > span");
//hide the second header for Privacy Policy
hideElement(".elementor-element-cc0f0e2");
// ========================================= Remove main header ====================================================
hideElement("header.mkdf-mobile-header");

//=======================================================remove footer=============================================
document.querySelector("div.mkdf-footer-top-inner").remove();
document.querySelector("div.mkdf-footer-bottom-holder").remove();

//================================Remove chatbot and accessibility tools icon======================================
hideElement("button.chatbot-toggler");
hideElement("div.pojo-a11y-toolbar-toggle");
