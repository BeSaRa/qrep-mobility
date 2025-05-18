(function () {
  let style = document.createElement("style");
  const primaryBg = "#121212"; /* Main background color */
//   const primaryBg = "#161616"; /* Main background color */
  const secondaryBg = "#1B1A17"; /* Secondary background color */
  const primaryText = "#ffffff"; /* Primary text color */
  const borderColor = "#434343"; /* border color */

  style.innerHTML = `
	body {
	background-color: ${primaryBg} !important;
	color: ${primaryText} !important;
	}
	.mkdf-content{
		background-color: ${primaryBg} !important;
	color: ${primaryText} !important;
	}
/************************************ Investor Journey **************************************/
	/*=========================================Start Study idea Dark theme====================================================*/

	/*----------background in the investing features----------*/
	
	div.elementor-element-18610d9 > div > div > div{
		background-color:  ${primaryBg} !important;
		border-color: ${borderColor} !important
	}
	/* ----------Text in the investing features---------------*/
	body > div.mkdf-wrapper > div > div > div > div 
	> div.elementor-element.elementor-element-6a45714.e-con-full.e-flex.e-con.e-parent.e-lazyloaded 
	> div.elementor-element.elementor-element-d11dc81.e-con-full.e-flex.e-con.e-child 
	> div.elementor-element.elementor-element-ca4ffd7.e-con-full.e-flex.e-con.e-child 
	> div.elementor-element.elementor-element-18610d9.ekit-equal-height-disable.elementor-widget.elementor-widget-elementskit-icon-box 
	> div > div > div > div > p {
		color: ${primaryText} !important;
	}
	/*-----------------اقتصاد مستقر ومرن-----------------------*/
	body > div.mkdf-wrapper > div > div > div > div 
	> div.elementor-element.elementor-element-a613171.e-con-full.e-flex.e-con.e-parent.e-lazyloaded {
		background-color: ${primaryBg} !important;
	}
	/*---------------كارد اقتصاد مستقر ومرن وتبعاتها---------------------*/
	body > div.mkdf-wrapper > div > div > div > div > div.elementor-element.elementor-element-a613171.e-con-full.e-flex.e-con.e-parent.e-lazyloaded > div > div.elementor-element.elementor-element-e2dc1d1.e-con-full.e-flex.e-con.e-child > div.elementor-element.elementor-element-cdd0ad9.e-con-full.e-flex.e-con.e-child,
	body > div.mkdf-wrapper > div > div > div > div > div.elementor-element.elementor-element-a613171.e-con-full.e-flex.e-con.e-parent.e-lazyloaded > div > div.elementor-element.elementor-element-60c855e.e-con-full.e-flex.e-con.e-child > div.elementor-element.elementor-element-5264910.e-con-full.e-flex.e-con.e-child,
	body > div.mkdf-wrapper > div > div > div > div > div.elementor-element.elementor-element-a613171.e-con-full.e-flex.e-con.e-parent.e-lazyloaded > div > div.elementor-element.elementor-element-715fa52.e-con-full.e-flex.e-con.e-child > div.elementor-element.elementor-element-5ed02fe.e-con-full.e-flex.e-con.e-child,
	body > div.mkdf-wrapper > div > div > div > div > div.elementor-element.elementor-element-a613171.e-con-full.e-flex.e-con.e-parent.e-lazyloaded > div > div.elementor-element.elementor-element-8c5e0ec.e-con-full.e-flex.e-con.e-child > div.elementor-element.elementor-element-0f478a4.e-con-full.e-flex.e-con.e-child{
		background-color: ${secondaryBg} !important;
	}
	/*------------المصدر: وزارة الصناعة والتجارة - قطر للسياحة------------*/
	body > div.mkdf-wrapper > div > div > div > div 
	> div.elementor-element.elementor-element-a613171.e-con-full.e-flex.e-con.e-parent.e-lazyloaded 
	> div > div.elementor-element.elementor-element-f60826f.elementor-widget.elementor-widget-elementskit-heading 
	> div > div > div > h3 {
		color: ${primaryText} !important;
	}
	/*----------المؤشرات العقارية للثلاث أرباع الأولى لسنة 2024 في قطر----------*/
	.elementor-element-2df2695 .elementor-element-27a890e{
		background-color: ${secondaryBg} !important;
	}
	body > div.mkdf-wrapper > div > div > div > div > div.elementor-element.elementor-element-2df2695.e-con-full.e-flex.e-con.e-child > div.elementor-element.elementor-element-27a890e.e-con-full.e-flex.e-con.e-child > div.elementor-shape.elementor-shape-top{
	display: none;
	}

	/*=========================================End Study idea Dark theme===========================================*/
	/*=========================================Start Choose your project Dark theme===========================================*/

	/*أولا: مناطق التملك الحر لغير القطريين*/
	div.elementor-element.elementor-element-4d91aad.e-con-full.e-flex.e-con.e-child 
	> div.elementor-element > div > div > a > div{
	background-color: ${secondaryBg} !important;
	}

	/*ثانياً: مناطق حق الانتفاع لغير القطريين*/
	div.elementor-element-c03fcb7 > div.elementor-element > div > div > a > div{
	background-color: ${secondaryBg} !important;
	}

	/*ثالثا: التملك في المجمعات السكنية أو المكاتب والمحلات التجارية لغير القطريين.*/
	div.elementor-element-94fd51a{
		background-color: ${secondaryBg} !important;
	}
	/*مشاريع التطوير العقاري*/
	/*English*/
	body > div.mkdf-wrapper > div > div > div > div > div.elementor-element.elementor-element-4f906f4 > div > div.elementor-element.elementor-element-a97fe92 > div.elementor-element> div > div > div > div > div.elementskit-box-body.ekit-image-box-body{
	
	background-color: ${secondaryBg} !important;
	border-color: transparent !important;
	}
	body > div.mkdf-wrapper > div > div > div > div > div.elementor-element.elementor-element-4f906f4 > div > div.elementor-element.elementor-element-a97fe92{
	margin-bottom: 40px;
	}
	/*Arabic*/
	body > div.mkdf-wrapper > div > div > div > div > div.elementor-element.elementor-element-433933a > div > div.elementor-element.elementor-element-042fb81> div.elementor-element> div > div > div > div > div.elementskit-box-body.ekit-image-box-body{
		background-color: ${secondaryBg} !important;
		border-color: transparent !important;
	}
	/*=========================================End Choose your project Dark theme===========================================*/
	/*=========================================Start Own your real state Dark theme===========================================*/

	/*الامتيازات الممنوحة لتملك غير القطريين*/
	/*BACKGROUND*/
	body > div.mkdf-wrapper > div > div > div > div > div.elementor-element.elementor-element-30e9cbc.e-con-full.e-flex.e-con.e-child > div.elementor-element.elementor-element-d6a2f7c.e-con-full.e-flex.e-con.e-child > div.elementor-element.elementor-element-a779c6a.e-con-full.e-flex.e-con.e-child > div.elementor-element.elementor-element-6535f97.e-con-full.e-flex.e-con.e-child,
	body > div.mkdf-wrapper > div > div > div > div > div.elementor-element.elementor-element-30e9cbc.e-con-full.e-flex.e-con.e-child > div.elementor-element.elementor-element-d6a2f7c.e-con-full.e-flex.e-con.e-child > div.elementor-element.elementor-element-cf9ff73.e-con-full.e-flex.e-con.e-child > div.elementor-element.elementor-element-7d0f9fe.e-con-full.e-flex.e-con.e-child{
		background-color: ${secondaryBg} !important;
		border-color: transparent !important; 
	}
	/*TEXT*/
	body > div.mkdf-wrapper > div > div > div > div > div.elementor-element.elementor-element-30e9cbc.e-con-full.e-flex.e-con.e-child > div.elementor-element.elementor-element-d6a2f7c.e-con-full.e-flex.e-con.e-child > div.elementor-element.elementor-element-cf9ff73.e-con-full.e-flex.e-con.e-child > div.elementor-element.elementor-element-7d0f9fe.e-con-full.e-flex.e-con.e-child > div.elementor-element.elementor-element-90577bc.elementor-icon-list--layout-traditional.elementor-list-item-link-full_width.elementor-widget.elementor-widget-icon-list > div > ul > li > span,
	body > div.mkdf-wrapper > div > div > div > div > div.elementor-element.elementor-element-30e9cbc.e-con-full.e-flex.e-con.e-child > div.elementor-element.elementor-element-d6a2f7c.e-con-full.e-flex.e-con.e-child > div.elementor-element.elementor-element-a779c6a.e-con-full.e-flex.e-con.e-child > div.elementor-element.elementor-element-6535f97.e-con-full.e-flex.e-con.e-child > div.elementor-element.elementor-element-dcef969.elementor-icon-list--layout-traditional.elementor-list-item-link-full_width.elementor-widget.elementor-widget-icon-list > div > ul > li > span{
		color: ${primaryText} !important;
	}
	
	/*حماية المستثمر*/
	.elementor-element-4ce45d4 .elementor-element{
		background: linear-gradient(45deg, ${secondaryBg}, transparent) !important;
	} 
		
	/*=========================================End Own your real state Dark theme===========================================*/
	img {
	filter: brightness(0.8) contrast(1.2);
	}
/*------------------------Tow Bottom buttons----------------*/
div.elementor-element-758c1d1, div.elementor-element-a991969, div.elementor-element-4b8d8d7, div.elementor-element-135492c, div.elementor-element-91f6e2a{
background: ${primaryBg} !important;
}
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
/*-------Steps Cards Content Ar----*/
	body > div.mkdf-wrapper > div > div > div > div > div.elementor-element.elementor-element-90737a5.e-con-full.e-flex.e-con.e-parent.e-lazyloaded > div > div.elementor-element.elementor-element-bf94f63.e-flex.e-con-boxed.e-con.e-child > div > div > div > div > div > .step-box .content{
	background-color:${secondaryBg} !important;
	}
	
/*-------Steps Cards Content En----*/
	body > div.mkdf-wrapper > div > div > div > div > div.elementor-element.elementor-element-bd0f3b3.e-con-full.e-flex.e-con.e-parent.e-lazyloaded > div > div.elementor-element.elementor-element-0259d4a.e-flex.e-con-boxed.e-con.e-child > div > div > div > div > div > .step-box .content{
	background-color:${secondaryBg} !important;
	}
	
/*-------تراخيص المطورون ----*/
	#developer-licenses > div.elementor-element.elementor-element-9ace9cc.e-con-full.e-flex.e-con.e-child > div.elementor-element.elementor-element-a226c1b.e-con-full.e-flex.e-con.e-child > .elementor-element {
		background: ${secondaryBg} !important;
	}
	#developer-licenses > div.elementor-element.elementor-element-9ace9cc.e-con-full.e-flex.e-con.e-child > div.elementor-element.elementor-element-a226c1b.e-con-full.e-flex.e-con.e-child > .elementor-shape {
		display:none;
	}
	/*زر المزيد*/	
	div.elementor-element-718304c .elementor-element{
		background: ${secondaryBg} !important;
		}
	div.elementor-element-718304c .elementor-shape{
		display:none !important;
	}

/*------- ترخيص البيع على الخارطة -----*/
	div.elementor-element-3ffc396 .elementor-shape{
		display:none;
	}
	/*red cards*/	
		.elementor-element-a0072aa > .elementor-element > div > div > div{
			background: ${primaryBg} !important;
		}
	/*blue cards*/
		.elementor-element-7ec650a > .elementor-element > div > div > div{
			background: ${primaryBg} !important;
		}
		div.elementor-element-fb703a7{
			background: ${secondaryBg} !important;
		} 
	/*زر المزيد*//*-----For Ar-----*/	
	div.elementor-element-175eafd .elementor-shape{
		display:none;
	}
	/*red cards*/	
		.elementor-element-855dd3f > .elementor-element > div > div > div{
			background: ${primaryBg} !important;
		}
	/*blue cards*/
		.elementor-element-00f6fd3 > .elementor-element > div > div > div{
			background: ${primaryBg} !important;
		}
	/*زر المزيد*//*-----For en-----*/
		div.elementor-element-5013af4 .elementor-shape{
			display:none;
		}
		div.elementor-element-dcfc6e8{
			background: ${secondaryBg} !important;
		} 
		/*red cards*/	
		.elementor-element-b070a64  > .elementor-element > div > div > div{
			background: ${primaryBg} !important;
		}
		/*blue cards*/
		.elementor-element-1ad609f > .elementor-element > div > div > div{
			background: ${primaryBg} !important;
		}	
/*------- رخصة اعلان -----*/	
	.elementor-element-1ffce4c{
		background:${secondaryBg} !important;
	}
/************************************ 	Professionals **************************************/
/*المثمن العقاري*/
	.elementor-element-0e302bc{
		background:${secondaryBg} !important;
	}

/*********************************** Authority News (In more bottm bar tap) ****************************/
/*background of cards list*/
body > div.mkdf-wrapper > div > div > div > div > div.elementor-element.elementor-element-6e559a6c.e-con-full.e-flex.e-con.e-parent.e-lazyloaded > div.elementor-element.elementor-element-5c3de537.e-con-full.e-flex.e-con.e-child > div.elementor-element.elementor-element-315ed2fe.e-con-full.blogs-news-page.e-flex.e-con.e-child > div > div > div > div > ul{
	background: ${primaryBg} !important;
}
/*card color*/
body > div.mkdf-wrapper > div > div > div > div > div.elementor-element.elementor-element-6e559a6c.e-con-full.e-flex.e-con.e-parent.e-lazyloaded > div.elementor-element.elementor-element-5c3de537.e-con-full.e-flex.e-con.e-child > div.elementor-element.elementor-element-315ed2fe.e-con-full.blogs-news-page.e-flex.e-con.e-child > div > div > div > div > ul > li > div{
	background: ${secondaryBg} !important;
	box-shadow: none;
}
/*More button*/
body > div.mkdf-wrapper > div > div > div > div > div.elementor-element.elementor-element-6e559a6c.e-con-full.e-flex.e-con.e-parent.e-lazyloaded > div.elementor-element.elementor-element-5c3de537.e-con-full.e-flex.e-con.e-child > div.elementor-element.elementor-element-315ed2fe.e-con-full.blogs-news-page.e-flex.e-con.e-child > div > div > div > div > ul > li > div > div.mkdf-bli-content > div.mkdf-bli-excerpt > div.mkdf-post-read-more-button > a{
	color:white;
	
}
body > div.mkdf-wrapper > div > div > div > div > div.elementor-element.elementor-element-6e559a6c.e-con-full.e-flex.e-con.e-parent.e-lazyloaded > div.elementor-element.elementor-element-5c3de537.e-con-full.e-flex.e-con.e-child > div.elementor-element.elementor-element-315ed2fe.e-con-full.blogs-news-page.e-flex.e-con.e-child > div > div > div > div > ul > li > div > div.mkdf-bli-content > div.mkdf-bli-excerpt > div.mkdf-post-read-more-button > a::after{
	background: ${secondaryBg} !important;
	box-shadow: none;
}
/*shadow in search faild*/
body > div.mkdf-wrapper > div > div > div > div > div.elementor-element.elementor-element-6e559a6c.e-con-full.e-flex.e-con.e-parent.e-lazyloaded > div.elementor-element.elementor-element-5c3de537.e-con-full.e-flex.e-con.e-child > div.elementor-element.elementor-element-686455eb.e-con-full.e-flex.e-con.e-child > div.elementor-element.elementor-element-1f346d6.elementor-widget-tablet__width-inherit.news-search.elementor-widget.elementor-widget-sidebar > div > div > form > div{
	box-shadow: none !important;
}
body > div.mkdf-wrapper > div > div > div > div > div.elementor-element.elementor-element-6e559a6c.e-con-full.e-flex.e-con.e-parent.e-lazyloaded > div.elementor-element.elementor-element-5c3de537.e-con-full.e-flex.e-con.e-child > div.elementor-element.elementor-element-686455eb.e-con-full.e-flex.e-con.e-child > div.elementor-element.elementor-element-1f346d6.elementor-widget-tablet__width-inherit.news-search.elementor-widget.elementor-widget-sidebar > div > div > form > div > button{
    margin-top: 5px;
    width: 40px;
    height: 40px;
    margin-right: 5px;
}
/*last news card*/
body > div.mkdf-wrapper > div > div > div > div > div.elementor-element.elementor-element-6e559a6c> div.elementor-element.elementor-element-5c3de537 > div.elementor-element.elementor-element-686455eb > div.elementor-element.elementor-element-72d20da4.elementor-widget-tablet__width-inherit.latest-posts.elementor-widget.elementor-widget-sidebar > div > div.widget.mkdf-blog-list-widget > div.mkdf-blog-list-holder.mkdf-grid-list.mkdf-disable-bottom-space.mkdf-bl-simple.mkdf-one-columns.mkdf-normal-space.mkdf-bl-pag-no-pagination.mkdf-bl-skin- > div > ul
> li > div:nth-child(1){
background: ${secondaryBg} !important;
    box-shadow: none !important;
}

/*********************************** AServices (In services tap) ****************************/
#services > div.services-flex > ul > li{
background: ${secondaryBg} !important;
border-color: ${borderColor}
}
#services > div.services-flex > ul > li > div > h4{
	color: ${primaryText} !important;
	font-weight: 500;

}
	/*قريبا*/
#all{
background: ${secondaryBg} !important;
}
/*============================== الرزنامة العقارية  Calender ===================*/
#ectbe-wrapper-b437ca4{
	background: ${primaryBg} !important;
}
#ectbe-wrapper-b437ca4 .ectbe-inner-wrapper {
  background-image: linear-gradient(to top, ${secondaryBg}, ${secondaryBg} 45%) !important;
}
  
`;
  document.head.appendChild(style);
})();
