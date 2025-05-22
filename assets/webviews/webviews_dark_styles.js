(function () {
  const style = document.createElement('style');
  const primaryBg = "#121212"; /* Main background color */
  const secondaryBg = "#1B1A17"; /* Secondary background color */
  const borderColor = "#434343"; /* border color */
  const mainFontColor = "#F4F4F4"; /* white smoke color */
  const secondFontColor = "#A29475"; /* golden color */
  const htmlLang = document.documentElement.lang || "en";
  const isArabic = htmlLang.startsWith("ar");

  // Common styles for both languages
  const commonStyles = `
    html, body {
      background-color: ${primaryBg} !important;
      color: ${mainFontColor} !important;
    }
    * {
      background-color: transparent !important;
      color: inherit !important;
      border-color: ${borderColor} !important;
    }
    img, video {
      filter: brightness(0.8) contrast(1.2);
    }
    h2, h3 {
      color: ${secondFontColor} !important;
    }
    #mkdf-back-to-top {
      background-color: #8A1538 !important;
    }
    /* Bottom buttons common styles */
    .elementor-element-758c1d1,
    .elementor-element-a991969,
    .elementor-element-91f6e2a,
    .elementor-element-135492c,
    .elementor-element-4b8d8d7 {
      margin: 30px 0 0 0 !important;
      padding: 10px 0 !important;
      justify-content: space-around !important;
      align-items: end !important;
      background: ${primaryBg} !important;
    }
    /* Common button design */
    body > div.mkdf-wrapper > div > div > div > div > div.elementor-element > div:nth-child(1) > div > div > a,
    body > div.mkdf-wrapper > div > div > div > div > div.elementor-element > div:nth-child(2) > div > div > a {
      width: 120px !important;
      height: 50px !important;
      border-radius: 10px !important;
      font-size: 16px !important;
      text-align: center !important;
      display: flex !important;
      justify-content: center !important;
      align-items: center !important;
      box-shadow: none !important;
    }
    /* Button colors */
    body > div.mkdf-wrapper > div > div > div > div > div.elementor-element > div:nth-child(1) > div > div > a {
      background-color: #0D4261 !important;
    }
    body > div.mkdf-wrapper > div > div > div > div > div.elementor-element > div:nth-child(2) > div > div > a {
      background-color: #8A1538 !important;
    }
	/*-------------------------------------------------------------------------------------------------------------*/  
    /* Second header in investor journey */
    div.elementor-element-c4dd43c,
    div.elementor-widget-container .elementor-shortcode span span.breadcrumb_last strong,
    div.elementor-widget-container .elementor-shortcode span span a {
      background-color: transparent !important;
      color: transparent !important;
    }
    /* Study the idea */
    h3.elementskit-section-subtitle {
      color: ${mainFontColor} !important;
    }
    /* Own your real estate cards */
    .elementor-element-4ce45d4 .elementor-element {
		background: linear-gradient(45deg, ${secondaryBg}, transparent) !important;
	}
	/* Own your real estate cards Details (مراقبة أداء الشركات)*/
	body > div.mkdf-wrapper > div > div > div > div > .elementor-element-7df9fad > div > div > div > span,
	body > div.mkdf-wrapper > div > div > div > div > .elementor-element-e2a672d > div > div > div > span{
	display:none;
	}
	/*----------- المطورين العقاريين real-estate developers------------------------*/
  /************************************ Property Debelopers **************************************/
/*-------Steps Boxs Ar----*/
	body > div.mkdf-wrapper > div > div > div > div > div.elementor-element.elementor-element-90737a5.e-con-full.e-flex.e-con.e-parent.e-lazyloaded > div > div.elementor-element.elementor-element-bf94f63.e-flex.e-con-boxed.e-con.e-child > div > div > div > div > div > .step-red > .circle-box > .circle{
		background-image: linear-gradient(${primaryBg}, ${primaryBg}), linear-gradient(180deg, #8A1538 0%, #26050F 100%) !important;
	}
	body > div.mkdf-wrapper > div > div > div > div > div.elementor-element.elementor-element-90737a5.e-con-full.e-flex.e-con.e-parent.e-lazyloaded > div > div.elementor-element.elementor-element-bf94f63.e-flex.e-con-boxed.e-con.e-child > div > div > div > div > div > .step-blue > .circle-box > .circle{
		background-image: linear-gradient(${primaryBg}, ${primaryBg}), linear-gradient(180deg, #0D4261 0%, #030A1F 100%) !important;
	}
	body > div.mkdf-wrapper > div > div > div > div > div.elementor-element.elementor-element-90737a5.e-con-full.e-flex.e-con.e-parent.e-lazyloaded > div > div.elementor-element.elementor-element-bf94f63.e-flex.e-con-boxed.e-con.e-child > div > div > div > div > div > .step-yellow > .circle-box > .circle{
		background-image:  linear-gradient(${primaryBg}, ${primaryBg}), linear-gradient(180deg, #B79769 0%, #432c0c 100%) !important;
	}
/*-------Steps Boxs En----*/
	body > div.mkdf-wrapper > div > div > div > div > div.elementor-element.elementor-element-bd0f3b3.e-con-full.e-flex.e-con.e-parent.e-lazyloaded > div > div.elementor-element.elementor-element-0259d4a.e-flex.e-con-boxed.e-con.e-child > div > div > div > div > div > .step-red > .circle-box > .circle{
		background-image: linear-gradient(${primaryBg}, ${primaryBg}), linear-gradient(180deg, #8A1538 0%, #26050F 100%) !important;
	}
	body > div.mkdf-wrapper > div > div > div > div > div.elementor-element.elementor-element-bd0f3b3.e-con-full.e-flex.e-con.e-parent.e-lazyloaded > div > div.elementor-element.elementor-element-0259d4a.e-flex.e-con-boxed.e-con.e-child > div > div > div > div > div > .step-blue > .circle-box > .circle{
		background-image: linear-gradient(${primaryBg}, ${primaryBg}), linear-gradient(180deg, #0D4261 0%, #030A1F 100%) !important;
	}
	body > div.mkdf-wrapper > div > div > div > div > div.elementor-element.elementor-element-bd0f3b3.e-con-full.e-flex.e-con.e-parent.e-lazyloaded > div > div.elementor-element.elementor-element-0259d4a.e-flex.e-con-boxed.e-con.e-child > div > div > div > div > div > .step-yellow > .circle-box > .circle{
		background-image:  linear-gradient(${primaryBg}, ${primaryBg}), linear-gradient(180deg, #B79769 0%, #432c0c 100%) !important;
	}
    /*cards*/
#developer-licenses > div.elementor-element.elementor-element-9ace9cc.e-con-full.e-flex.e-con.e-child > div.elementor-element.elementor-element-a226c1b.e-con-full.e-flex.e-con.e-child > div.elementor-element.elementor-element-9d61ae2.e-con-full.e-flex.e-con.e-child,
#developer-licenses > div.elementor-element.elementor-element-9ace9cc.e-con-full.e-flex.e-con.e-child > div.elementor-element.elementor-element-a226c1b.e-con-full.e-flex.e-con.e-child > div.elementor-element.elementor-element-526107f.e-con-full.e-flex.e-con.e-child{
  background-image: linear-gradient(45deg, #7F1F3B73 10%, ${primaryBg} 25%);
} 

#developer-licenses > div.elementor-element.elementor-element-9ace9cc.e-con-full.e-flex.e-con.e-child > div.elementor-element.elementor-element-a226c1b.e-con-full.e-flex.e-con.e-child > div.elementor-element.elementor-element-e42364b.e-con-full.e-flex.e-con.e-child{
  background-image: linear-gradient(45deg, #00165954 10%, ${primaryBg} 25%);
} 

	/*زر المزيد*/	
	body > div.mkdf-wrapper > div > div > div > div > div.elementor-element.elementor-element-8ecc425.e-con-full.e-flex.e-con.e-parent.e-lazyloaded > div.elementor-element.elementor-element-718304c.e-con-full.e-flex.e-con.e-child > div.elementor-element.elementor-element-05cfa11.e-con-full.e-flex.e-con.e-child,
  body > div.mkdf-wrapper > div > div > div > div > div.elementor-element.elementor-element-8ecc425.e-con-full.e-flex.e-con.e-parent.e-lazyloaded > div.elementor-element.elementor-element-718304c.e-con-full.e-flex.e-con.e-child > div.elementor-element.elementor-element-0f3bce0.e-con-full.e-flex.e-con.e-child
  {
  background-image: linear-gradient(45deg, #7F1F3B73 10%, ${primaryBg} 25%);
		}
  body > div.mkdf-wrapper > div > div > div > div > div.elementor-element.elementor-element-8ecc425.e-con-full.e-flex.e-con.e-parent.e-lazyloaded > div.elementor-element.elementor-element-718304c.e-con-full.e-flex.e-con.e-child > div.elementor-element.elementor-element-51e3308.e-con-full.e-flex.e-con.e-child{
    background-image: linear-gradient(45deg, #00165954 10%, ${primaryBg} 25%)!important;
  } 
/**************************** Calender الرزنامة العقارية ***************************************/
#ectbe-wrapper-b437ca4 .ectbe-inner-wrapper.ectbe-simple-event{
background-image: linear-gradient(to top, ${secondaryBg}, transparent 45%)!important;
}
#ectbe-wrapper-b437ca4 .ectbe-inner-wrapper.ectbe-simple-event .ectbe-evt-more-box a,
#tribe-events-footer > nav > ul > li.tribe-events-nav-next > a,
#tribe-events-footer > nav > ul > li.tribe-events-nav-previous > a{
  color:#8A1538 !important;
}

  `;

  // Language-specific styles
  const arabicStyles = `
    .elementor-element-758c1d1 {
      top: 100% !important;
      transform: translate(-2px, calc(-100% - 30px)) !important;
      display: flex !important;
    }
/* Calender cards details (الرزنامة العقارية)*/
  #post-31654 > div.tribe-events-single-section.tribe-events-event-meta.primary.tribe-clearfix,
  #post-25791 > div.tribe-events-single-section.tribe-events-event-meta.primary.tribe-clearfix,
  #post-29959 > div.tribe-events-single-section.tribe-events-event-meta.primary.tribe-clearfix{
    background-image: linear-gradient(to top, ${secondaryBg}, transparent 45%)!important;
  }
  `;

  const englishStyles = `
        /* Calender cards details (الرزنامة العقارية)*/
    /*details cards*/
#post-31671 > div.tribe-events-single-section.tribe-events-event-meta.primary.tribe-clearfix,
#post-28305 > div.tribe-events-single-section.tribe-events-event-meta.primary.tribe-clearfix,
#post-29981 > div.tribe-events-single-section.tribe-events-event-meta.primary.tribe-clearfix{
    background-image: linear-gradient(to top, ${secondaryBg}, transparent 45%)!important;
}

 
    .elementor-element-758c1d1 {
      top: 100% !important;
      transform: translate(-2px, calc(-100% - 30px)) !important;
      display: flex !important;
    }
    .elementor-element-91f6e2a,
    .elementor-element-135492c {
      top: 100% !important;
      transform: translate(-2px, calc(-100% - 90px)) !important;
    }
  `;

  // Combine all styles
  style.innerHTML = commonStyles + (isArabic ? arabicStyles : englishStyles);

  document.head.appendChild(style);
})();

// (function () {
//   const style = document.createElement('style');
//     const primaryBg = "#121212"; /* Main background color */
// /*   const primaryBg = "#161616"; /* Main background color */
//   const secondaryBg = "#1B1A17"; /* Secondary background color */
// /*   const primaryText = "#ffffff"; /* Primary text color */
//   const borderColor = "#434343"; /* border color */
//   const mainFontColor = "#F4F4F4"; /* white smoke color */
//   const secondFontColor = "#A29475"; /* golden color */
// const htmlLang = document.documentElement.lang || "en"; // default to English if undefined
//   const isArabic = htmlLang.startsWith("ar");
  
//   if(isArabic){

//   style.innerHTML = `
//     html, body {
// 		background-color: ${primaryBg} !important;
// 		color: ${mainFontColor} !important;
//     }
//     *{
// 		background-color: transparent !important;
// 		color: inherit !important;
// 		border-color: ${borderColor} !important;
//     }
//     img, video {
//         filter: brightness(0.8) contrast(1.2);
//     }
//     /* a {
//         color: #8ab4f8 !important;
// 	}*/
// 	h2,h3{
// 		color: ${secondFontColor} !important;

// 	}
// /*arrow background color in the end-left/right of each page*/
// 	#mkdf-back-to-top {
// 		background-color: #8A1538 !important;
// 	}
// /*------------------------Tow Bottom buttons----------------*/
// /* Bottom container styles */
// .elementor-element-758c1d1 {
//   margin: 30px 0 0 0 !important;
//   padding: 10px 0 !important;
//   justify-content: space-around !important;
//   align-items: end !important;
//   background: ${primaryBg} !important;
//   top: 100% !important;
//   transform: translate(-2px, calc(-100% - 30px)) !important;
//   display: flex !important; /* Ensure flex container */
// }

//   /*-------تملك عقارك وتمتع بالمميزات------*/
// .elementor-element-a991969,.elementor-element-91f6e2a,
// .elementor-element-135492c
// {
//     bottom = 0;
//     margin = 30px 0 0 0;
//     padding = 10px 0;
//     justifyContent = space-around;
//     alignItems = end;
//     background = ${primaryBg};
// }
//   /*-----------اختر مشروعك-------------*/
// .elementor-element-4b8d8d7{
//     bottom = 0;
//     margin = 30px 0 0 0;
//     padding = 10px 0;
//     justifyContent = space-around;
//     alignItems = end;
//     background = ${primaryBg};
// }

// /* Common button design */
// body > div.mkdf-wrapper > div > div > div > div > div.elementor-element > div:nth-child(1) > div > div > a,
// body > div.mkdf-wrapper > div > div > div > div > div.elementor-element > div:nth-child(2) > div > div > a
// {
//   width: 120px !important;
//   height: 50px !important;
//   border-radius: 10px !important;
//   font-size: 16px !important;
//   text-align: center !important;
//   display: flex !important;
//   justify-content: center !important;
//   align-items: center !important;
//   box-shadow: none !important;
// }

// /* Specific button colors (next and back) */
// body > div.mkdf-wrapper > div > div > div > div > div.elementor-element > div:nth-child(1) > div > div > a {
//   background-color: #0D4261 !important;
// }

// body > div.mkdf-wrapper > div > div > div > div > div.elementor-element > div:nth-child(2) > div > div > a {
//   background-color: #8A1538 !important;
// }

// /*----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/		
// /* second header in investor journey */
// 	div.elementor-element-c4dd43c,
// 	div.elementor-widget-container .elementor-shortcode span span.breadcrumb_last strong,
// 	div.elementor-widget-container .elementor-shortcode span span a {
//         background-color: transparent !important;
//   		color: transparent !important;
// }
// /*Study the idea دراسة فكرة شراء العقار*/
// 	h3.elementskit-section-subtitle{
// 		color: ${mainFontColor} !important;
// 	}
// /*Own your real estate تملك عقارك*/
// 	/*cards in the end of the page*/
// 		.elementor-element-4ce45d4 .elementor-element{
// 			background: linear-gradient(45deg, ${secondaryBg}, transparent) !important;
// 		} 
//   `;
  
//   }
//   else{
// 	 style.innerHTML = `
//     html, body {
// 		background-color: ${primaryBg} !important;
// 		color: ${mainFontColor} !important;
//     }
//     *{
// 		background-color: transparent !important;
// 		color: inherit !important;
// 		border-color: ${borderColor} !important;
//     }
//     img, video {
//         filter: brightness(0.8) contrast(1.2);
//     }
//     /* a {
//         color: #8ab4f8 !important;
// 	}*/
// 	h2,h3{
// 		color: ${secondFontColor} !important;

// 	}
// /*arrow background color in the end-left/right of each page*/
// 	#mkdf-back-to-top {
// 		background-color: #8A1538 !important;
// 	}
// /*------------------------Tow Bottom buttons----------------*/
// /* Bottom container styles */
// /*ادر عقارك*/
// .elementor-element-758c1d1{
//   margin: 30px 0 0 0 !important;
//   padding: 10px 0 !important;
//   justify-content: space-around !important;
//   align-items: end !important;
//   background: ${primaryBg} !important;
//   top: 100% !important;
//   transform: translate(-2px, calc(-100% - 30px)) !important;
//   display: flex !important; /* Ensure flex container */
// }
//   /*ادرس الفكرة + تواصل مع الخبراء*/
// .elementor-element-91f6e2a,
// .elementor-element-135492c {
//   margin: 30px 0 0 0 !important;
//   padding: 10px 0 !important;
//   justify-content: space-around !important;
//   align-items: end !important;
//   background: ${primaryBg} !important;
//   top: 100% !important;
//   transform: translate(-2px, calc(-100% - 90px)) !important;
// }
//   /*-------تملك عقارك وتمتع بالمميزات------*/
// .elementor-element-a991969
// {
//     bottom = 0;
//     margin = 30px 0 0 0;
//     padding = 10px 0;
//     justifyContent = space-around;
//     alignItems = end;
//     background = ${primaryBg};
// }
//   /*-----------اختر مشروعك-------------*/
// .elementor-element-4b8d8d7{
//     bottom = 0;
//     margin = 30px 0 0 0;
//     padding = 10px 0;
//     justifyContent = space-around;
//     alignItems = end;
//     background = ${primaryBg};
// }

// /* Common button design */
// body > div.mkdf-wrapper > div > div > div > div > div.elementor-element > div:nth-child(1) > div > div > a,
// body > div.mkdf-wrapper > div > div > div > div > div.elementor-element > div:nth-child(2) > div > div > a
// {
//   width: 120px !important;
//   height: 50px !important;
//   border-radius: 10px !important;
//   font-size: 16px !important;
//   text-align: center !important;
//   display: flex !important;
//   justify-content: center !important;
//   align-items: center !important;
//   box-shadow: none !important;
// }


// /* Specific button colors (next and back) */

// body > div.mkdf-wrapper > div > div > div > div > div.elementor-element > div:nth-child(1) > div > div > a {
//   background-color: #0D4261 !important;
// }

// body > div.mkdf-wrapper > div > div > div > div > div.elementor-element > div:nth-child(2) > div > div > a {
//   background-color: #8A1538 !important;
// }

// /*----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/		
// /* second header in investor journey */
// 	div.elementor-element-c4dd43c,
// 	div.elementor-widget-container .elementor-shortcode span span.breadcrumb_last strong,
// 	div.elementor-widget-container .elementor-shortcode span span a {
//         background-color: transparent !important;
//   		color: transparent !important;
// }
// /*Study the idea دراسة فكرة شراء العقار*/
// 	h3.elementskit-section-subtitle{
// 		color: ${mainFontColor} !important;
// 	}
// /*Own your real estate تملك عقارك*/
// 	/*cards in the end of the page*/
// 		.elementor-element-4ce45d4 .elementor-element{
// 			background: linear-gradient(45deg, ${secondaryBg}, transparent) !important;
// 		} 
//   `;
//   }
//   document.head.appendChild(style);
// })();
