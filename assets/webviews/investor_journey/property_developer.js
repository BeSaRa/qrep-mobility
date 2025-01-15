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
/**************************************** First Section ************************************************************************************/

/**************************************** Other Sections ************************************************************************************/

// ============================= Remove main header =============================================
hideElement("header.mkdf-mobile-header");

//================================== remove header =========================================================
hideElement("div.elementor-element-b95efc7");
hideElement("div.elementor-element-f683bc9");

//================================== Developer licenses=========================================================
//-----remove header -----
hideElement("div.elementor-element-7614a71");

//================================== Off-plan sales license=========================================================
//-----remove header -----
hideElement("div.elementor-element-4bfa50f");
//-----remove MORE INFO button AR----
hideElement(
  "body > div.mkdf-wrapper > div > div > div > div > div.elementor-element.elementor-element-e38f622.e-con-full.e-flex.e-con.e-parent.e-lazyloaded > div > div.elementor-element.elementor-element-4666ace.e-con-full.e-flex.e-con.e-child > div > div > div > a"
);
//-----remove MORE INFO button EN----
hideElement(
  "body > div.mkdf-wrapper > div > div > div > div > div.elementor-element.elementor-element-dcfc6e8.e-con-full.e-flex.e-con.e-parent.e-lazyloaded > div.elementor-element.elementor-element-f60e1b5.e-con-full.e-flex.e-con.e-child > div > div > div > a"
);

//========================================== حساب الضمان =========================================================
//-----remove header -----
hideElement("div.elementor-element-39988c7");

//========================================== رخصة الإعلان=========================================================
//-----remove header -----
hideElement("div.elementor-element-9b7e751");

//========================================== لجنة فض منازعات التطوير العقاري =========================================================
//-----remove header -----
hideElement("div.elementor-element-e360c16");

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
