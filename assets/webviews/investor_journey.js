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
//===================== remove elements from <<Connect with real estate experts>> section =====================
hideElement("div.elementor-element-8e79833");

//======================Start Remove buttons from views======================

// إزالة زر المزيد من كل كارد موجود في صفحة اختر مشروعك
var buttonElements = document.querySelectorAll(
  "div.elementor-element .elementor-element .elementor-widget-container .ekit-wid-con .elementskit-info-image-box .elementskit-box-body .elementskit-box-footer"
);
if (buttonElements) {
  buttonElements.forEach(function (buttonElement) {
    buttonElement.style.display = "none";
  });
}
//ازالة زر المزيد من المعلومات في صفحة تملك عقارات قسم البيع على الخارطة
hideElement("div.elementor-element-1b0cc35");

//======================End Remove buttons from views============================================================

//===================== remove elements from <<Manage real estate>> section =====================================
hideElement("div.elementor-element-9ea6aa4 .elementor-element-525e575");
setTransparentBackground("div.elementor-element-9ea6aa4");

//===================== remove elements from <<Choose your project>> section ====================================
hideElement("div.elementor-element-ffe1297");

//===================== remove elements from <<Own real estate>> section ========================================
//Own your real estate element
hideElement("div.elementor-element-95c4f01");

//الخريطة
hideElement("div.elementor-element-2dbe930");
//الزر باللغة الانكليزية
hideElement(".elementor-element-b815a82 > div > div > a");

//حساب الضمان
hideElement("div.elementor-element-493a0ef");

//اتحاد الملاك
hideElement("div.elementor-element-d29eef9");
hideElement("div.elementor-element-e8e78fa");
//الزر باللغة الانكليزية
hideElement(".elementor-element-8af3d13 > div > div > a");

//مراقبة أداء الشركات
setTransparentBackground("div.elementor-element-7df9fad");
//En
hideElement("div.elementor-element-335d4a5");
setTransparentBackground(
  "body > div.mkdf-wrapper > div > div > div > div > div.elementor-element.elementor-element-7df9fad.e-con-full.e-flex.e-con.e-child > div > div > div > span > span:nth-child(2) > a"
);

//تمكين المستثمر
setTransparentBackground("div.elementor-element-e2a672d");
setTransparentBackground(
  "body > div.mkdf-wrapper > div > div > div > div > div.elementor-element.elementor-element-e2a672d.e-con-full.e-flex.e-con.e-child > div > div > div > span > span:nth-child(2) > a"
);
//En
setTransparentBackground("div.elementor-element-cc36507");
hideElement(".elementor-element-bc71543");

// ========================================= Remove main header ====================================================
hideElement("header.mkdf-mobile-header");

//========================================== remove header =========================================================
setTransparentBackground("div.elementor-element-c4dd43c");
setTransparentBackground(
  "div.elementor-widget-container .elementor-shortcode span span.breadcrumb_last strong"
);
var mainPageElement = document.querySelector(
  "div.elementor-widget-container .elementor-shortcode span span a"
);
if (mainPageElement) {
  mainPageElement.style.backgroundColor = "transparent";
  mainPageElement.style.color = "transparent";
  mainPageElement.setAttribute("href", "javascript:void(0)");
}
//=======================================================remove footer=============================================
document.querySelector("div.mkdf-footer-top-inner").remove();
document.querySelector("div.mkdf-footer-bottom-holder").remove();

//================================Remove chatbot and accessibility tools icon======================================
hideElement("button.chatbot-toggler");
hideElement("div.pojo-a11y-toolbar-toggle");

//=============================== remove elements from <<STUDY IDEA>> section ======================================
hideElement(".elementor-element-71b215f");

//===================================== viewport for responsiveness =======================================================
var meta = document.createElement("meta");
meta.name = "viewport";
meta.content =
  "width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no";
document.getElementsByTagName("head")[0].appendChild(meta);