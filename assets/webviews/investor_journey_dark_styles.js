(function () {
let style = document.createElement("style");
const primaryBg = "#161616"; /* Main background color */
const secondaryBg = "#222222"; /* Secondary background color */
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
	div.elementor-element-bf9e44c > .elementor-element > div > div > div > div > .elementskit-box-body{
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
`;
document.head.appendChild(style);
})();