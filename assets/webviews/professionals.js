//----------NOTE: DON'T CHANGE THE LINE ORDERS CAUSE I PUT THEM BY PRIORITY--------
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

// ============================= Remove main header =============================================
hideElement("header.mkdf-mobile-header");

//================================== remove header =========================================================
setTransparentBackground("div.elementor-element-e306598");
hideElement("div.elementor-element-f683bc9");

//================================== More button =========================================================
hideElement("div.elementor-element-d26ef3c");

//=======================================================remove footer=============================================
document.querySelector("div.mkdf-footer-top-inner").remove();
document.querySelector("div.mkdf-footer-bottom-holder").remove();

//================================Remove chatbot and accessibility tools icon======================================
hideElement("button.chatbot-toggler");
hideElement("div.pojo-a11y-toolbar-toggle");

//===================================== viewport for responsiveness =======================================================
var meta = document.createElement("meta");
meta.name = "viewport";
meta.content =
"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no";
document.getElementsByTagName("head")[0].appendChild(meta);
