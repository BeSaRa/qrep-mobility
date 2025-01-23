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
	function waitForElementWithScroll(selector, callback, checkInterval = 200) {
	const observer = new MutationObserver(() => {
		const element = document.querySelector(selector);
		if (element) {
		observer.disconnect(); // Stop observing once the element is found
		callback(element); // Trigger the callback
		}
	});
	
	// Start observing the entire document for changes
	observer.observe(document.body, { childList: true, subtree: true });
	
	// Add scroll listener to check during scrolling
	window.addEventListener("scroll", () => {
		const element = document.querySelector(selector);
		if (element) {
		observer.disconnect(); // Stop observing
		callback(element); // Trigger the callback
		}
	});
	
	// Fallback: Periodically check if the element exists
	const intervalId = setInterval(() => {
		const element = document.querySelector(selector);
		if (element) {
		clearInterval(intervalId); // Stop the interval check
		observer.disconnect(); // Stop observing
		callback(element); // Trigger the callback
		}
	}, checkInterval);
	}
	
/********************************* Contact Us *************************************/

//------------the second header of the page---------
hideElement("div.elementor-element-8133992");

//------------hide the View in Map button above the showing map---------
// hideElement("");
waitForElementWithScroll(
	"#mapDiv > div > div.gm-style > div:nth-child(4) > div > div > div > div",
	(element) => {
	  // Apply styles or actions to the dynamically loaded element
	  element.style.display = "none"; // Example: Hide the element
	  element.style.color = "red"; // Example: Hide the element

	}
  );
//------make a Margin for the h1-------
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
