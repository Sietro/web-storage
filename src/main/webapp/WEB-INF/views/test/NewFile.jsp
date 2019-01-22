<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>네이버 클라우드</title>
<meta http-equiv="x-dns-prefetch-control" content="on">
<link rel="dns-prefetch" href="https://fe.cloud.naver.net" pr="0.1">
<link rel="dns-prefetch" href="https://files.cloud.naver.com" pr="0.2">
<link rel="dns-prefetch" href="https://api.cloud.naver.com" pr="0.2">
<link rel="dns-prefetch" href="https://ssl.pstatic.net" pr="0.3">
<link rel="dns-prefetch" href="https://thumb1.photo.cloud.naver.com" pr="0.5">
<link rel="dns-prefetch" href="https://thumb2.photo.cloud.naver.com" pr="0.5">
<link rel="dns-prefetch" href="https://photo.cloud.naver.com" pr="0.6">
<link rel="dns-prefetch" href="https://photo.cloud.naver.net" pr="0.7">
<link rel="preconnect" href="https://fe.cloud.naver.net" crossorigin="use-credentials" pr="0.1">
<link rel="preconnect" href="https://files.cloud.naver.com" crossorigin="use-credentials" pr="0.2">
<link rel="preconnect" href="https://api.cloud.naver.com" crossorigin="use-credentials" pr="0.2">

	<link rel="stylesheet" type="text/css" href="https://fe.cloud.naver.net/static/release/css/main-part1.css?20181220140627">
	<link rel="stylesheet" type="text/css" href="https://fe.cloud.naver.net/static/release/css/main-part2.css?20181220140627">
	<link rel="stylesheet" type="text/css" href="https://fe.cloud.naver.net/static/release/css/main-target.css?20181220140627">

<script type="text/javascript">
	document.domain = "naver.com";

	var ccsrv = "cc.naver.com",
		lcs_SerName = "lcs.naver.com",
		g_ssc = "me.ndrive",
		nsc = g_ssc;

	window.g_config = {
		deploy: "release",
		target: "NAVER",
		version: "20181220140627",
		clientType: "NHN/ND-WEB Ver",
		locale: {
			id: "ko_KR",
			lang: "ko",
			country: "KR"
		},
		protocol: location.protocol + "//",
		domain: {
			ems: location.host, //"cloud.naver.com",
			api: "api.cloud.naver.com"
		},
		url: {
			cdn: "https://ssl.pstatic.net${0}",
			ems: "${0}",
			api: location.protocol + "//" + "api.cloud.naver.com${0}",
			fe: "https://fe.cloud.naver.net${0}",
		},
		capacity: {
			max: Math.pow(1024, 4) + (30 * Math.pow(1024, 3))
		}
	};
	
	window.g_config.logged = true;
	window.g_config.user = {
		id: "tncrja",
		idx: "3702243",
		idc: "2"
	};
	window.g_config.timezone = "Asia/Seoul:+9";
	window.g_config.domain.cms = "files.cloud.naver.com";
	window.g_config.url.cms = window.g_config.protocol + window.g_config.domain.cms + "${0}";
	
</script>
<!--[if IE]>
<script type="text/javascript" charset="UTF-8" src="https://ssl.pstatic.net/static/pwe/cloud/js/es5-shim.js"></script>
<![endif]-->
<script type="text/javascript" charset="UTF-8" src="https://ssl.pstatic.net/static/pwe/cloud/js/es6-shim.js"></script>

	
	
		<script type="text/javascript" charset="UTF-8" src="https://fe.cloud.naver.net/static/release/lang/core-ko_KR.js?20181220140627"></script>
		<script type="text/javascript" charset="UTF-8" src="https://fe.cloud.naver.net/static/bundle/vendor.js?20181220140627"></script>
	







<script type="text/javascript">
	window.config.append({
		now: "2019-01-14T12:13:24+09:00",
		domain: {
			cookie: "cloud.naver.com",
			photo: "photo.cloud.naver.com",
			photo_fe: "photo.cloud.naver.net",
			mail: "mail.naver.com",
			contact: "contact.naver.com",
			thumbnail: "thumb1.photo.cloud.naver.com,thumb2.photo.cloud.naver.com".split(",")
		}
	});
	window.config.append({
		url: {
			photo: window.config("protocol") + window.config("domain.photo") + "${0}",
			photoV2: window.config("protocol") + window.config("domain.photo") + "/v2${0}",
			uploader: {
				flash: window.config("url.ems", "/flash/NDrive_FileUploader.swf"),
				airAgent: window.config("url.ems", "/flash/air/NDrive_Web_Agent.swf?" + window.config("version")),
				air: window.config("url.ems", "/flash/air/AirRuncher.swf?" + window.config("version")),
				activeX: window.config("url.ems", "/activex.nhn?" + window.config("version"))
			},
			contact: window.config("protocol") + window.config("domain.contact"),
			office: {
				viewer: window.config("protocol") + "viewer.cloud.naver.com/viewer.nhn",
				word: window.config("protocol") + "word.office.naver.com/word",
				slide: window.config("protocol") + "slide.office.naver.com/slide",
				cell: window.config("protocol") + "cell.office.naver.com/cell",
				form: window.config("protocol") + "form.office.naver.com/form"
			},
			explorer: {
				win32: "http://cdn.naver.com/naver/tools/launcher/Toolbox-NDrive.exe",
				win64: "http://cdn.naver.com/naver/tools/launcher/Toolbox-NDrive_x64.exe",
				mac: "http://cdn.naver.com/naver/mac/ndrive/NdriveInstall.dmg"
			},
			emsPortable: window.config("protocol") + "m.cloud.naver.com"
		},
		user: {
			internal: false,
			external: false,
			useWorks: false,
			useVersion: true,
			sharedCount: 1,
			payment: false,
			paymentQuota : "",
			shareRegister: true,
			alreadyRegisteredId: "",
			ipPenalty: false,
			isAgeAgreement : false,
			redirectUrl: "",
            useDataHome : false,
			homeId : window.config.escape(""),
			restrictDownload : false, // 용량초과로 인한 다운로드/감상 제한
            auth : "normal"
			/*auth : normal, groupId, socialId, realName, alreadyUser, agreement*/
		},
		family:{
            useFamilyShare : false,
            isFamilyMaster : false,
            isFamilyExpired : false,
			masterId : ""
        },
		setup: {
			skin: { code: "WH", className: "skin_white" },
			startPage: "F", // F-폴더, S-특별한 순간, A-모든 사진
			startPhoto: false,
			bodysearch: false,
			officeViewer: true,
			compressDownload: {
				enable: false,
				url: window.config("protocol") + "dl.cloud.naver.com/drive/resources",
				type: "drive"
			},
			portable: {
				aos: "2.6.1",
				ios: "2.6.1"
			},
			folderUrlPage : false,
			supportNOffice: true
		},
		banner: {
			noticePopup: true,
			top: {
				data:  {"bannerData":{"imageHeight":49,"imageWidth":358,"show":false,"imageUrl":"https://ssl.pstatic.net/static/pwe/cloud/promotion/bn_pay_358x49_181220.jpg","imageAlt":"네이버 페이 이벤트","linkType":"popup","linkUrl":"https://campaign.naver.com/npay/refill/","popupHeight":0,"popupWidth":0,"showYn":"y","expireCookieDate":365,"linkImageUrl":"https://ssl.pstatic.net/static/pwe/nm/bn/btn_link_120313.png","linkImageWidth":55,"linkImageHeight":12,"linkAlt":"자세히 보기","addtionalLinkImageUrl":"","addtionalLinkImageWidth":0,"addtionalLinkImageHeight":0,"addtionalLinkUrl":"","addtionalLinkAlt":"","addtionalLinkType":"popup","addtionalLinkPopupWidth":0,"addtionalLinkPopupHeight":0,"rawLinkType":"POPUP","rawAddtionalLinkType":"POPUP","cookieValue":"","pweServiceCode":"NDRIVE","promotionType":"image","cookieKey":"","promotionId":"image_promotion","modifyTime":"2019-01-11 13:33:32.0"},"cookieValue":"","pweServiceCode":"NDRIVE","expireCookieDate":365,"promotionType":"image","cookieKey":"","promotionId":"image_promotion","modifyTime":"2019-01-11 13:33:32.0","viewType":"image"}
			},
			payment: {
				
				
				data: { "totalspace":32212254720,"unusedspace":31106573703, "unusedspaceStr":"28.97GB" },
				
				
				
				images: [
					"https://ssl.pstatic.net/static/pwe/ndrive/promotion/bn_30to200gb_181002.png",
					"https://ssl.pstatic.net/static/pwe/ndrive/promotion/bn_30to2tb_180911.png",
					"https://ssl.pstatic.net/static/pwe/ndrive/promotion/bn_2tblevelup_180911.png"
				]
			}
		},
		promotion: {
			start: "2018-12-24 10:00:00",
			end: "2019-03-19 23:00:00"
		}
	});

	
	
	window.config.set("capacity", {
		info: {
            
			largefileunusedspace: 31223379061,
			filemaxsize: 4294967296,
			totalspace: 32212254720,
			largefileusedspace: 988875659,
			unusedspace: 31106573703,
			totallargespace: 32212254720,
			largefileminsize: 52428800,
			usedspace: 1105681017
		},
		waste: {
  "cycle" : 30,
  "size" : 0
}
	});
	
	
	

	window.config.set("promotion.data", {
		
		aPromotionList : [
		
			
   			
		
   		
   				
		   			{ "sBoldTitle":"","sComment":"PC와 모바일 모두에 적용되는 주소록 암호잠금 기능 출시! 어떤 상황에서도 안전하게 연락처를 보호하세요.","sURL":"https://contact.naver.com/","sNotiType":"new","nPopupWidth":"800", "nPopupHeight":"600", "bPopupBlank":"n"}
   		
        ],
		bActivity : true,
  		nCurrentIDX : 0,
  		nFirstPromotionCount : 0,
   		changeTime : parseInt("1546595476098", 10),
   		
   			
				nPromotionView : 0
			
			
		
	});
	//GNB
	var gnb_service = "ndrive";				
	var gnb_logout = "https://www.naver.com"; 
	var gnb_template = "gnb_ut8";	        
	var gnb_brightness = 3;
	var gnb_item_hide_option= 8;            
	var gnb_one_naver = 1;
</script>

</head>
<body class="ko_KR">


<div class="_initialize_loading_layer first_loading" style="z-index:10000000;display:block">
	<div style="width:100%;height:100%;background-color:#fff;filter: alpha(opacity=50);-moz-opacity: 0.5;opacity: 0.5;"></div>
	<div class="ld_line1">
		<img alt="" src="https://ssl.pstatic.net/static/pwe/ndrive/deskhome/new_loading_999.gif">
	</div>
</div>

<div id="wrap" class="_wrap skin_white">
<div id="u_skip">
	<a href="#nav_snb"><span>네이버 클라우드 폴더목록 바로가기</span></a>
	<a href="#content"><span>네이버 클라우드 파일목록 바로가기</span></a>
</div>
	



<link rel="stylesheet" type="text/css" href="https://ssl.pstatic.net/pwe/css/deskhome_header_https_20181204.css">
<script type="text/javascript" charset="UTF-8" src="https://ssl.pstatic.net/pwe/js/release/deskhome_menu_https_ns_20180720.js"></script>
<div id="header" class="{=OPTION_CLASS}">
	<h1>
		<a href="http://www.naver.com" class="naver"><span class="blind">NAVER</span></a>
		<a href="#" class="_svc_lnk pwe_home"><span class="_header_tit blind">메일</span></a>
	</h1>
	<!-- 로그인 -->
	<div class="login_group">
		<!-- GNB -->
		<div id="gnb" class="gnb">
		</div>
		<!-- //GNB -->
	</div>
	<!-- //로그인 -->
	<div class="gnb_area">
		<h2 class="blind">PWE서비스 바로가기</h2>
		<div class="gnb_list_box" id="gnb_list">
			<div class="gnb_first">
				<ul>
					<li class="_mail mail"><a title="메일" href="https://mail.naver.com" class="mail" accesskey=""><span class="blind">메일</span><span style="display:none" class="article_num"><em class="_count"></em><span class="tail"></span></span></a></li>
					<li class="_calendar calendar"><a title="캘린더" href="https://calendar.naver.com" class="calendar" accesskey=""><span class="blind">캘린더</span><span style="display:none" class="article_num"><em class="_count"></em><span class="tail"></span></span></a></li>
					<li class="_memo memo"><a title="메모" href="https://memo.naver.com" class="memo" accesskey=""><span class="blind">메모</span><span style="display:none" class="article_num"><em class="_count"></em><span class="tail"></span></span></a></li>
					<li class="_contact contact"><a title="주소록" href="https://contact.naver.com" class="address" accesskey=""><span class="blind">주소록</span><span style="display:none" class="article_num"><em class="_count"></em><span class="tail"></span></span></a></li>
					<li class="_ndrive ndrive"><a title="네이버 클라우드" href="https://cloud.naver.com" class="ndrive" accesskey=""><span class="blind">네이버 클라우드</span><span style="display:none" class="article_num"><em class="_count"></em><span class="tail"></span></span></a></li>
					<li class="_office office"><a title="오피스" href="https://office.naver.com" class="office" accesskey=""><span class="blind">오피스</span><span style="display:none" class="article_num"><em class="_count"></em><span class="tail"></span></span></a></li>
					<li class="_moneybook moneybook"><a title="가계부" href="http://moneybook.naver.com" class="moneybook" accesskey=""><span class="blind">가계부</span><span style="display:none" class="article_num"><em class="_count"></em><span class="tail"></span></span></a></li>
				</ul>
			</div>
			<div class="gnb_last">
				<a class="btn_more" title="메뉴 더보기" href="#"><span class="blind">더보기</span></a>
				<ul class="_gnb_last">
					<li class="_notify notify"><a title="알림" href="http://me.naver.com/tab/noti.nhn" class="notify" accesskey=""><span class="blind">알림</span><span style="display:none" class="article_num"><em class="_count"></em><span class="tail"></span></span></a></li>
					<li class="_myfeed myfeed"><a title="MY구독" href="http://me.naver.com/tab/news.nhn" class="myfeed" accesskey=""><span class="blind">MY구독</span><span style="display:none" class="article_num"><em class="_count"></em><span class="tail"></span></span></a></li>
					<li class="_bookmark bookmark"><a title="북마크" href="http://me.naver.com/tab/bookmark.nhn" class="bookmark" accesskey=""><span class="blind">북마크</span><span style="display:none" class="article_num"><em class="_count"></em><span class="tail"></span></span></a></li>
				</ul>
			</div>
		</div>
	</div>
	<span class="skin_lft_element"></span>
	<span class="skin_rgt_element"></span>
</div>

	<!-- container -->
	<div id="container" class="_container">
		<div class="context_menu rightmenu_layer" id="context_menu_layer" style="display:none;position:absolute;z-index:10;"></div>
		<!-- Left -->
		



<!-- snb -->
<div id="nav_snb" class="_view_nav_snb">
	<div class="nav_snb_scrl">

		<div class="profile">
			<div style="display:none">
				<div class="profile_img none_thum">
					<span class="thmb"><img src="https://ssl.pstatic.net/static/pwe/photo/blank.gif" width="64" height="64" alt=""></span>
				</div>
				<h2 class="profile_title">
					<span class="badge _profile-grade" style="display:none"
						  data-premium-class="badge_p"
						  data-premium-text="프리미엄 등급"
						  data-gold-class="badge_g"
						  data-gold-text="골드 등급"></span>
					<span class="_profile-name"></span>
				</h2>
				<div class="profile_storage">
					<ul class="capacity_partition">
						<li class="_capacity_use">
							<a class="lnk_status" href="/pay/main.nhn" target="_blank">
								<p class="partition_capacity" style="color: #418cff;"><!-- em>22.4</em>GB--></p>
								<p class="partition_name">사용중</p>
							</a>
						</li>
						<li style="color: #23d3bb" class="_capacity_family">
							<p class="partition_capacity"><!-- <em>50</em>GB--></p>
							<p class="partition_name">가족</p>
						</li>
						<li class="_capacity_unuse"> <!-- status_over -->
							<p class="partition_capacity"><!-- <em>119.8</em>GB--></p>
							<p class="partition_name">여유 공간</p>
						</li>
					</ul>
					<ul class="bar_capacity_graph">
						<li class="item stacked" style="background: #418cff;width: 0%;z-index:10"></li>
						<li class="item _capacity_graph_family" style="background: #23d3bb;width: 0%;"></li>
					</ul>
					<dl class="capacity_info">
						<dd class="_my_product">내 이용권</dd>
						<dt class="_my_product"><a class="_product" href="#"><!-- 상품 명 노출 --></a></dt>
						<dd class="_family_storage">가족 스토리지</dd>
						<dt class="_family_storage"><a class="_family_manage" href="#"><!-- 관리 / 초대하기 중 하나. --></a></dt>
					</dl>
					<button type="button" class="btn_purchase">이용권 구매</button>
				</div>
			</div>
		</div>
		<div class="snb_group _left_width">
			
			<div class="snb_box _with_viewer">
				<h3 class="snb_title"><a href="#" class="js-toggle _view_menu_with_view">함께보기<span class="ic_fold"></span></a></h3>
				<ul class="snb_list"></ul>
				<script class="_template_defaultItem" type="text/template">
					{{~it :value}}
					<li class="_template_item">
						<a href="http://photo.cloud.naver.com/v2/#newgroup/{{= value.id }}" class="list_name" onclick="clickcr(this,'lef.togethermake','','',event)">
							<strong class="gr_img thum_{{= value.id }}"></strong>
							<p class="gr_box">
								<span class="gr_name" title="{{= value.name }}">{{= window.util.escapeHtml(value.name) }}</span>
							</p>
						</a>
					</li>
					{{~}}
				</script>
				<script class="_template_item" type="text/template">
					<li data-groupid="{{= it.groupId }}" class="_template_item">
						<a href="http://photo.cloud.naver.com/v2/#timeline/{{= it.groupId }}" class="list_name" onclick="clickcr(this,'lef.togetherlist','','',event)">
							<strong class="gr_img" style="background-image:url({{=it.coverUrl}}?type=ff42_42)"></strong>
							<p class="gr_box">
								{{? it.updateCount }}<span class="m_number">{{= it.updateCount }}</span>{{?}}
								<span class="gr_name" title="{{= it.groupName }}">{{= window.util.escapeHtml(it.groupName) }}</span>
							</p>
						</a>
					</li>
				</script>
				<script class="_template_add_to" type="text/template">
					<li class="add_to _template_add_to">
						<a href="http://photo.cloud.naver.com/v2/#newgroup" class="list_name" onclick="clickcr(this,'lef.togethermake','','',event)">
							<strong class="gr_img"></strong>
							<span class="gr_name ellipsis">새 모임</span>
						</a>
					</li>
				</script>
				<a href="#" class="btn_type_l _more">더보기</a>
			</div>
			<div class="snb_box">
				<h3 class="snb_title"><a href="#" class="_view_menu_file_photo">사진<span class="ic_fold"></span></a></h3>
				<ul class="snb_list_v2">
					<li class="js-clusterlist js-cluster"><a href="#" class="_clusterlist list_name" onclick="clickcr(this,'lef.special','','',event)">특별한 순간</a></li>
					<li class="js-upload js-datelist js-date"><a href="#" class="_upload list_name" onclick="clickcr(this,'lef.allphoto','','',event)">모든 사진</a></li>
					<li class="js-albumlist js-album"><a href="#" class="_albumlist list_name" onclick="clickcr(this,'lef.photoalbum','','',event)">앨범</a></li>
					<li class="js-folder js-sharedfolder"><a href="#" class="_folder list_name" onclick="clickcr(this,'lef.photofolder','','',event)">폴더</a></li>
				</ul>
			</div>
			<div class="snb_box">
				<h3 class="snb_title _mnu_movie"><a href="#" class="_view_menu_file_movie">동영상</a></h3>
			</div>
			<div class="snb_box">
				<h3 class="snb_title _mnu_doc"><a href="#" class="_view_menu_file_doc">문서</a></h3>
			</div>
			<div class="snb_box ">
				<h3 class="snb_title _mnu_music"><a href="#" class="_view_menu_file_music">음악</a></h3>
			</div>
			<div class="snb_box _tree_container">
				<h3 class="snb_title _mnu_folder"><a href="#" class="_view_menu_folder">폴더<span class="ic_fold"></span></a></h3>
				<div class="section_art_area _tree_container_area">

					<!-- 내 N드라이브 -->
					<div class="section_art filetree_art _normal_tree _context_menu_area">

						<!-- [D] 선택시 .click 클래스 추가 -->
						

						<!-- [D] 마우스오버시 h3에 ovr 클래스 추가 -->
						<!-- [D] 클릭시 h3에 click 클래스 추가 -->
						<h3 class="menu_tit _view_menu_ndrive_root _root _tree_root _droparea">
							<span class="ml_t"><span class="ml_ico ml_nd1">&nbsp;</span><a class="ma _link_left_root" href="#"><strong class="_root _context_menu_area" onmouseover="nhn.NDrive.Layout.LeftNavigation.underline(this,true)" onmouseout="nhn.NDrive.Layout.LeftNavigation.underline(this,false)">네이버 클라우드</strong></a></span>
						</h3>
						<div class="list_filetree fold_hide _view_menu_ndrive_tree_container">
							<ul id="tree">
								<!-- [D] 하위폴더가 열린 경우 button태그에 open_child 클래스 추가 -->
								<!-- [D] 선택된 폴더 는 a태그에 selected 클래스 추가 -->
							</ul>
						</div>
						<h3 class="basket menu_tit _view_menu_trashbox _trashbox"><span class="ml_t"><span class="ml_ico ml_nd2">&nbsp;</span><a class="ma _droparea _trashbox _basket_ani _link_left_trashbox" href="#" onmouseover="nhn.NDrive.Layout.LeftNavigation.underline(this,true)" onmouseout="nhn.NDrive.Layout.LeftNavigation.underline(this,false)">휴지통</a><span class="case_mb _case_mb"></span><a href="#"
																																																																																																															   class="btn_clean _btn_clean _link_left_trashbox_all_remove">
						비우기</a></span></h3>
					</div>
					<!-- //내 N드라이브 -->
					<div class="section_art section_art_share filetree_art _shared_tree  _context_menu_area _dnd_album">
						<div class="tit_s"><a href="#" class="_folding_share"><em class="l_bu"><span class="blind">접기/펴기</span></em>공유</a></div>
						<h3 class="menu_tit first _view_menu_shared_folder">
							<button class="tree-button">+</button>
							<span class="ml_t"><span class="ml_ico ml_sh1">&nbsp;</span><a class="ma _sharedroot _link_left_sharedroot" href="#"><strong onmouseover="nhn.NDrive.Layout.LeftNavigation.underline(this,true)" onmouseout="nhn.NDrive.Layout.LeftNavigation.underline(this,false)">공유받은 폴더</strong></a><span class="add_ml"><a href="#" class="_link_left_invite_shared_list">신규<em
									class="_count">0</em></a></span></span>
						</h3>

						<!-- [D] 마우스오버시 ovr 클래스 추가 -->
						<!-- [D] 클릭시 click 클래스 추가 -->
						<!-- <h4 class="h_lft_g1"><div class="hl_type _view_menu_shared_folder"><strong>공유받은 폴더</strong><span class="hipen" style="display:none;">|</span><span class="n_numb _new_shared_list" style="display:none;">신규<em class="_count">0</em></span></div></h4>  -->
						<div class="common_tree fold_hide _view_menu_ndrive_tree_container_shared">
							<ul id="tree_shared"><!-- 폴더펼침 아이콘은 div에 tree-selected 주면 자동으로 바뀝니다 -->
								<!-- [D] 하위폴더가 열린 경우 button태그에 open_child 클래스 추가 -->
								<!-- [D] 선택된 폴더 는 a태그에 selected 클래스 추가 -->
							</ul>
						</div>
						<h3 class="menu_tit _view_menu_sharing_folder">
							<span class="ml_t"><span class="ml_ico ml_sh2">&nbsp;</span><a class="ma _link_left_sharingroot" href="#"><strong onmouseover="nhn.NDrive.Layout.LeftNavigation.underline(this,true)" onmouseout="nhn.NDrive.Layout.LeftNavigation.underline(this,false)">공유한 폴더/파일</strong></a></span>
						</h3>
					</div>
					<!-- 최근업데이트, 최근열어본, 중요표시한 파일 보기 -->
					<div class="section_art  _view_activity">
						<ul class="menu_add">
							<!-- [D] 마우스오버시 li에 ovr 클래스 추가 -->
							<!-- [D] 클릭시 li에 click 클래스 추가 -->
							<li class="_view_menu_latest_update_file"><span class="ml_t"><span class="ml_ico ml_bu1">&nbsp;</span><a href="#" class="ma _droparea _collection _link_left_latest_update" onmouseover="nhn.NDrive.Layout.LeftNavigation.underline(this,true)" onmouseout="nhn.NDrive.Layout.LeftNavigation.underline(this,false)">최근 업데이트 된 파일 보기</a><span class="new_update _new_update" style="display:none;">&nbsp;</span></span></li>
							<li class="_view_menu_latest_open_list"><span class="ml_t"><span class="ml_ico ml_bu2">&nbsp;</span><a href="#" class="ma _droparea _collection _link_left_latest_open" onmouseover="nhn.NDrive.Layout.LeftNavigation.underline(this,true)" onmouseout="nhn.NDrive.Layout.LeftNavigation.underline(this,false)">최근 열어 본 파일 보기</a></span></li>
							<li class="_view_menu_important_file"><span class="ml_t"><span class="ml_ico ml_bu3">&nbsp;</span><a href="#" class="ma _droparea _collection _link_left_important_file" onmouseover="nhn.NDrive.Layout.LeftNavigation.underline(this,true)" onmouseout="nhn.NDrive.Layout.LeftNavigation.underline(this,false)">중요 표시한 파일/폴더 보기</a></span></li>
						</ul>
					</div>
				</div>

				<div class="more_basket">
					<a href="#" class="_view_menu_trashbox _link_left_trashbox _basket">휴지통<span class="ic_bask"></span></a>
				</div>

				<!-- 다운로드 배너-->
				<div class="left_banner  _download_addon">
					<ul>
						<li class="win"><a href="http://software.naver.com/software/summary.nhn?softwareId=MFS_105031" target="_blank" onclick="clickcr(this,'lic.explorer','','',event)"><span class="b_ic"></span><span class="text">윈도우 탐색기</span></a></li>
						<li class="mac"><a href="https://itunes.apple.com/us/app/ndeulaibeu/id975815190?ls=1&mt=12" target="_blank" onclick="clickcr(this,'lic.macex','','',event);"><span class="b_ic"></span><span class="text">맥 탐색기</span></a></li>
						<li class="mob"><a target="_blank" onclick="clickcr(this,'lic.mobileapp','','',event);window.drive.plugin('appProposal', [ 'ndrive' ]);return false;" href="http://mobile.naver.com/service/ndrive" class="_view_menu_mobile"><span class="b_ic"></span><span class="text">모바일 앱</span></a></li>
						<li class="print"><a class="_view_menu_photo_print" target="_blank" href="http://photoprint.naver.com/index.nhn"><span class="b_ic"></span><span class="text">포토 인화</span></a></li>
					</ul>
				</div>
				<div class="bizinfo_side">
					<p>사업자등록번호 : 220-81-62517</p>
					<p>통신판매업 신고번호 :<br/>경기 성남 제 2006-692호</p>
					<p class="named">상호 : 네이버㈜</p>
					<p>대표이사 : 한성숙</p>
					<p>대표전화 : 1588-3820</p>
					<p>이메일 : <a href="mailto:ccnaver@naver.com">ccnaver@naver.com</a></p>
					<p>주소 :<br/>경기도 성남시 분당구 불정로6 그린팩토리</p>
					<ul class="bizinfo_lst">
						<li><a href="http://www.naver.com/rules/service.html" target="_blank">이용약관</a></li>
						<li><a href="#" onclick="window.open('/pay/purchase/agreement.nhn', 'payAgreement', 'width=452, height=451, scrollbars=yes,toolbar=no, location=no, resizable=yes, status=no,menubar=no'); return false;" target="_blank">유료상품 이용약관</a></li>
						<li><a href="http://www.ftc.go.kr/info/bizinfo/communicationView.jsp?apv_perm_no=2006378010630200692&area1=&area2=&currpage=1&searchKey=04&searchVal=2208162517&stdate=&enddate=" target="_blank">사업자등록정보</a></li>
						<li><a href="http://www.naver.com/rules/privacy.html" target="_blank"><strong>개인정보처리방침</strong></a></li>
					</ul>
				</div>
			</div>
		</div>

	</div>
	<div class="split_bar"></div>
</div>
<!-- snb -->

		<!-- //Left -->
		<div id="section_cen">
			<div id="section_cen_fix">

				<!-- right Area -->
				





<div id="content" class="_content">
	<!-- 상단 고정영역 -->
	<div id="cont_fix_area">
		<div class="ct_area _layout_content_top" style="position:relative !important;left:0 !important;">

			<!-- 프로모션 -->
			<div class="cmn_promotion_text _promotion _droparea" style="display:none">
				<div class="rolling_container"></div>
				<button class="prom_close _click_close" title="닫기"><span>닫기</span></button>
			</div>
			<!-- //프로모션 -->

			<!-- 상단 띠배너 -->
			<div id="top_banner" class="cmn_promotion_image _top_banner" style="display:none;"></div>
			<!-- //상단 띠배너 -->

			<div class="path_search">
				<!-- 좌측접기 -->
				<a href="#" class="btn_fold _btn_navigation_fold"><span class="spr"></span><span class="blind">폴더목록영역 접기/펴기</span></a>
				<!-- //좌측접기 -->
				<!-- Search Area -->
				<div class="left_path">
					<div class="search_area _quick_search">
						<fieldset>
							<legend>검색</legend>
							<input type="text" id="search_input" name="p_search" accesskey="s" class="input_txt _textbox_quick_search">
							<a href="#" class="search_btn _link_search_btn_quick_search"><label for="search_input" class="blind">검색</label></a>
						</fieldset>
					</div>
					<a href="#" class="detail _link_search_detail_search_toggle">상세&nbsp;<span class="ico_bu"></span></a>
				</div>
				<!-- //Search Area -->
				<!-- 말줄임용: width 필요 -->
				<h2 class="path ellipsis _location" style="height:18px;">
					<span class="_share_info" style="display:none;"><span class="bu bu_folder bu_works _bu_p_folder_icon"></span><strong class="l_tit _p_path"></strong><span class="hipen2 _p_path_hipen">&nbsp;|</span></span>
					<strong class="l_tit _current_info"><span class="bu bu_folder _bu_folder_icon"></span>&nbsp;<span class="_current_path"></span></strong>
					<span class="r_art _shared_info" style="display:none;"><span class="path_2t _owner_name"></span></span>
					<span class="r_art _sharing_info" style="display:none;"><a class="bu _sharing_manager" style="display:none"></a><span class="hipen">|</span><span class="path_2t _sharing_msg"></span></span>
					<span class="r_art _sharing_url" style="display:none;"><span class="path_2t"><a href="#" class="i_url_adm"><em class="blind">URL</em></a></span></span>
					<span class="_works_capacity"></span>
					<span class="_back_music_collection" style="display:none;"><span class="prev_hipen">|</span>&nbsp;<span class="prev_page"><span class="ico">&nbsp;</span><a href="#">이전</a></span></span>
				</h2>
			</div>
			<!-- 상세검색 옵션 레이어-->
			<div class="detail_layer _detail_search_view" style="display:none;"></div>
			<!-- //상세검색 옵션 레이어-->
			<div class="button_sort _function_button">
				<span class="task_check"><input type="checkbox" class="_link_list_all_check"></span>
				<ul class="button _normal_button">
					<li class="_upload task_blind">
						<button class="but_up"><span class="tx"><strong>올리기</strong></span></button>
					</li>
					<!-- [D] 크롬업로드일경우 노출  -->
					<li class="_new_upload task_blind">
						<button class="but_up"><span class="tx"><strong>올리기</strong></span><span class="bu bu_layer _open_menu"></span></button>
						<input type="file" multiple="multiple" title="파일 올리기" class="up_file_all">
						<div class="rightmenu_layer _upload_menu_layer" style="top:28px;display:none;">
							<ul>
								<li class="imp_li"><a href="#">파일 올리기</a> <input type="file" multiple="multiple" title="파일 올리기"></li>
								<li class="imp_li"><a href="#">폴더 올리기</a> <input type="file" webkitdirectory="webkitdirectory" mozdirectory="mozdirectory" directory="directory" title="폴더 올리기"></li>
							</ul>
						</div>
					</li>
					<li class="_download task_blind">
						<button class="but_dw"><span class="tx"><strong>내려받기</strong></span></button>
					</li>
					<li class="_delete task_blind">
						<button class="but_dl"><span class="bu bu_del"></span><span class="tx"><strong>삭제</strong></span></button>
					</li>
					<li>
						<button type="button" class="ta_ic tg _together task_blind" onclick="clickcr(this,'top.together','','',event);"><em class="ic_tg"></em>함께보기</button>
					</li>

					<li class="_new_folder task_blind">
						<button><span class="tx">새폴더</span></button>
					</li>
					<li class="_clear_trashbox task_blind">
						<button><span class="tx">휴지통 비우기</span></button>
					</li>
					<li class="_restore task_blind">
						<button><span class="tx">복원</span></button>
					</li>
					<li class="rela_menu _edit_menu">
						<button class="_edit_button"><span class="tx">편집</span><span class="bu bu_layer"></span></button>
						<!-- 편집 레이어 -->
						<div class="_editing_menu_layer"></div>
						<!--// 편집 레이어 -->
					</li>

					<li class="bar_line rela_menu _share task_blind">
						<button class="_share_split"><span class="tx"><strong>공유</strong></span><span class="bu bu_layer"></span></button>
						<!-- 공유하기 레이어 -->
						<div class="rightmenu_layer _share_menu_layer" style="top:28px;display:none;">
							<ul class="imp_ly2 _sharing">
								<li><a href="#" class="_folder">공유 멤버 초대</a></li>
								<li><a href="#" class="_url">공유 URL 만들기</a></li>
							</ul>
						</div>
						<!--// 공유하기 레이어 -->
					</li>
					<li class="bar_line rela_menu _share_cancel task_blind">
						<button><span class="tx">공유해제</span></button>
					</li>
					<li class="bar_line _file_url_share task_blind">
						<button><span class="bu bu_foldershare"></span><span class="tx"><strong>공유</strong></span></button>
					</li>
					<li class="rela_menu _send_menu task_blind">
						<button class="_send_button"><span class="tx">보내기</span><span class="bu bu_layer"></span></button>
						<!-- 보내기 레이어 -->
						<div class="_sending_menu_layer"></div>
						<!--// 보내기 레이어 -->
					</li>
					<li class="bar_line _works_folder_share task_blind">
						<button title="특정 구성원에게만 폴더 접근 허용"><span class="bu bu_set_share"></span><span class="tx"><strong>권한설정</strong></span></button>
					</li>
					<li class="rela_menu _select_doc_type task_blind">
						<!-- 문서유형 선택 -->
						<button class="" id="btn_select_doc_type"><span class="tx">문서 유형</span><span class="bu bu_layer"></span></button>
						<!--// 문서유형 선택 -->
					</li>
					<li class="bar_line _doc_viewer task_blind">
						<button type="button"><span class="tx">문서뷰어로 열기</span></button>
					</li>
					<li class="bar_line _share_manager task_blind">
						<button type="button"><span class="tx">권한 관리</span></button>
					</li>
					<li class="bar_line _member_list task_blind">
						<button type="button"><span class="tx">멤버 보기</span></button>
					</li>
				</ul>

				<ul class="button _invite_share_button">
					<!-- 신규 공유 초대받은 화면의 버튼 -->
					<li class="_btn_accept">
						<button><span>공유 수락</span></button>
					</li>
					<li class="_btn_reject">
						<button><span>거절</span></button>
					</li>
					<!-- //신규 초대받은 공유폴더 -->
				</ul>

				<!-- 뷰타입 설정 버튼들 -->
				<div class="right_sort _view_mode">
					<a href="#" class="btn_report _btn_report task_blind">신고</a>
					<ul class="sort_view _music" style="display:none;">
						<li class="m_ty1 _album"><a title="앨범별 보기" href="#"><span class="blind">앨범별 보기</span><span class="so_bg"></span></a></li>
						<li class="m_ty2 _artist"><a title="아티스트별 보기" href="#"><span class="blind">아티스트별 보기</span><span class="so_bg"></span></a></li>
					</ul>
					<ul class="_default">
						<li class="v_ty1 _detail"><a title="자세히 보기" href="#"><span class="blind">자세히 보기</span><span class="so_bg"></span></a></li>
						<li class="v_ty2 _thumbnail on"><a title="아이콘 보기" href="#"><span class="blind">아이콘 보기</span><span class="so_bg"></span></a></li>
					</ul>
				</div>
			</div>

		</div>

		<div class="datail_layer_tit _search_result_info" style="display:none">
			<h4><strong>파일 검색 결과</strong><span class="tit _search_keyword"></span></h4>
			<p class="btn_more_se _go_body_search" style="display:none;"><a href="#" class="_go_body_search_more_view">본문 검색 결과 보기</a></p>
			<p class="btn_more_se _go_file_search" style="display:none;"><a href="#" class="_go_file_search_more_view">파일 검색 결과 보기</a></p>
		</div>
	</div>
	<!-- //상단 고정영역 끝 -->


	<!-- 중앙 영역 -->
	<div id="cont_flex_area" class="content_box">
		<div id="ndrive_list_area" class="lrcont_area _layout_content_middle reply_none"><!-- [D] 공유글 열렸을 시 reply_open 클래스 추가 -->
			<!-- 리스트 영역 -->
			<div class="lcont">
				<div class="lcont_fix" id="ndrive_list_fix">
					<div class="load_more_cont _loading_layer" style="display:none">
						<img src="https://ssl.pstatic.net/static/pwe/ndrive/new_ndrive/loading_PC_white2.gif" alt="로딩중..">
					</div>

					<!-- Detail View Area -->
					<div class="type_list _type_list" style="display:none;">
						<div class="datail_layer_tit _search_keyword">
							<h4><strong>파일 검색 결과</strong><span class="tit _keyword"></span></h4>
						</div>
						<div class="list_sort_tbl">
							<ul class="list_head _list_head _droparea _list_sort"></ul>
						</div>
						<div class="type_list_box _droparea _context_menu_area _list_scroll">
							<ul class="list_body_group _list _droparea"></ul>
						</div>
						<p class="btn_more_se _result_more_view" style="display:none;"><a href="#" class="_go_file_search_more_view">파일 검색 결과 더보기</a></p>
					</div>

					<div class="type_list search_box search_box_li _type_body_search" style="display:none;">
						<div class="datail_layer_tit _search_keyword">
							<h4><strong>본문 검색 결과</strong><span class="tit _keyword"></span></h4>
							<a class="btn_works_use _btn_use_works_folder" href="#"><span class="bu w_ic"></span>본문 검색 사용 중인 폴더</a>
						</div>
						<div class="list_sort_tbl">
							<ul class="list_head _list_head _droparea _list_sort"></ul>
						</div>
						<div class="type_list_box _context_menu_area _list_scroll">
							<ul class="list_body_group2 _list _droparea"></ul>
						</div>
						<p class="btn_more_se _result_more_view" style="display:none;"><a href="#" class="_go_body_search_more_view">본문 검색 결과 더보기</a></p>
					</div>
					<!-- //Detail View Area -->

					<!-- Thumbnail View Area -->
					<div class="_type_thumb _droparea" style="display:none;">
						<div class="list_sort _droparea _list_sort">
							
							정렬기준 : <a href="#" class="_sort_subject"></a>- <a href="#" class="dn _sort_order"><span class="bu"></span></a>
							<div class="right_ar _shareinfo_link" style="display:none;">
								<a class="sc _member" href="#">초대 멤버 관리</a><span>-</span> <a class="dn_s _history" href="#">공유 히스토리 보기</a>
							</div>
						</div>
						<ul class="type_thumb _list _context_menu_area _droparea"></ul>
					</div>
					<!-- //Thumbnail View Area -->

					<!-- album View Area -->
					<div class="_type_album">
						<!-- 앨범 모아보기 -->
						<ul class="type_album _list _context_menu_area"></ul>
						<!-- 음악목록 By 앨범 보기 -->
						<div class="type_list album_list _music_list" style="display:none;">
							<div class="list_sort_tbl">
								<ul class="list_head _list_head _droparea _list_sort"></ul>
							</div>
							<div class="type_list_box _list_body _droparea _list_scroll"></div>
						</div>
						<!-- //음악목록 By 앨범 보기 -->
					</div>
					<!-- //album View Area -->

					<!-- artist View Area -->
					<div class="_type_artist">
						<!-- 아티스트 모아보기 -->
						<ul class="type_album _list _context_menu_area"></ul>
						<!-- 앨범 By 아티스트 보기 -->
						<div class="type_list artist_list _music_list" style="display:none;">
							<div class="list_sort_tbl">
								<ul class="list_head _list_head _droparea _list_sort"></ul>
							</div>
							<div class="type_list_box _list_body _droparea _list_scroll"></div>
						</div>
						<!-- //앨범 By 아티스트 보기 -->
					</div>
					<!-- //artist View Area -->
				</div>
			</div>
			<!-- //리스트 영역 -->
			<!-- 메모 영역 -->
			<div class="reply_area _share_memo_frame">
				<div class="toggle_base">
					<div class="reply_write nodata _share_memo_write_frame"><!-- [D] 입력내용 없을 시 reply_write 클래스에 nodata 클래스 추가 -->
						<fieldset>
							<legend>글쓰기</legend>
							<span class="write_txt"><span class="write_inp"><span><textarea rows="1" cols="1" class="_share_memo_write_form _EVENT(SHAREMEMO_WRITE_TEXTAREA)" _value="보고 있는 폴더에 새 글을 남겨 주세요.">보고 있는 폴더에 새 글을 남겨 주세요.</textarea></span></span><span class="write_btn"><a href="#" title="글 등록" class=" _EVENT(SHAREMEMO_WRITE)">확인</a></span></span>
						</fieldset>
					</div>
					<div class="reply_scroll _share_memo_list_frame">
						<div class="reply_zoom _share_memo_content_frame">
							<div class="reply_bot _share_memo_btn_moreview"><a href="#">이전 글 더보기</a></div>
							<!-- 내용 있을 때 -->
							<ul class="reply_list _share_memo_list _listContent"></ul>
							<!-- //내용 있을 때 -->

							<!-- 내용 없을 때 -->
							<div class="no_reply _share_memo_noreply">
								공유 폴더와 관련된 정보를 나눠 보세요.<br><br>글을 남기면 네이버me와<br>네이버 클라우드 알림으로<br>폴더를 공유하는 멤버들에게 알려 드립니다.
							</div>
							<!-- //내용 없을 때 -->

						</div>
					</div>
				</div>
				<span class="reply_abs"><span class="reply_bg"><a href="#" class="reply_btn _share_memo_btn_toggle"><span class="arrow">&nbsp;</span><em class="close">닫기</em><!-- [D] 덧글이 없을 경우 <em class="open">덧글쓰기</em> --><em class="open">글&nbsp;<strong>28</strong></em></a></span></span><!-- [D] reply_btn 클릭시 lrcont_area 에 reply_open 클래스 토글 -->
				<span class="toggle"><a href="#" class="_share_memo_btn_toggle2"><em>&nbsp;</em></a></span><!-- [D] 클릭시 lrcont_area 에 reply_open 클래스 토글 -->
			</div>
			<!-- //메모 영역 -->
		</div>

		<!-- 공유받은폴더 또는 공유한폴더가 없는경우 -->
		<div class="share_box_scrl _share_no_list" style="display:none;"></div>
		<!-- //공유받은폴더 또는 공유한폴더가 없는경우 -->

		<!-- 아이콘뷰(기존 썸네일뷰) 템플릿 -->
		<textarea id="ndrive_tmpl_thumb_folder" style="display:none;width:0;height:0;">
			<li class="{{= it.sItemClass }}" _resourceno="{{= it.sResourceNO }}" title="{{= it.sHtmlTitle }}" _extension="{{= it.sFileType || "" }}">
				<div class="check">
					{{= it.sCheckBoxTag }}
					{{= it.sImportantTag }}
					{{= it.sSharedTypeTag }}
				</div>
				<div class="thumb_box _item_thumb_box {{= it.sDragDropClass }} {{= it.sRightClickClass }} {{= it.sDimClass }}">
					<table cellspacing="0" cellpadding="0"><tbody><tr><td class="_item_thumb_box {{= it.sDimClass }} {{= it.sUrlShareClass }}">{{= it.sThumbnailTag }}</td></tr></tbody></table>
					<div class="title">
						<div class="_item_thumb_box"><a class="_item_thumb_box _link_list_item_filename  _iconthubmnail" href="#" onclick="return false;">{{= it.sRecentUpdateTag }}{{= it.sViewTitle }}</a></div>
						<p class="rate">{{= it.sSize }}</p>
					</div>
					{{= it.sVideoFileTag }}
					{{= it.sDimmedFileTag }}
				</div>
			</li>
		</textarea>

		<textarea id="ndrive_tmpl_thumb_blank_folder" style="display:none;width:0;height:0;">
			<li class="_blank_folder _item _droparea" onmousedown="return false;" title="{{= it.sHtmlTitle }}">
				<div class="check"></div>
				<div class="thumb_box _item_thumb_box">
					<table cellspacing="0" cellpadding="0"><tbody><tr><td class="_item_thumb_box"><p class="bu bu_root_b _item_thumb_box {{= it.sWorksFolderClass || '' }}"><span class="blind">{{= it.sHtmlTitle }}</span></p></td></tr></tbody></table>
					<div class="title _item_thumb_box"><a href="#" class="_link_list_blank_folder">..</a></div>
				</div>
			</li>
		</textarea>
	</div>
	<!-- //중앙 영역 끝-->

	<!-- 하단 고정영역 -->
	<div id="cont_aid_area" class="content_box_bottom">
		<!-- Page Navigation -->
		<div class="paginate _paginate loaded" style="z-index:10000;display:none;">
			<a href="#" class="pre_end" title="처음"><span class="blind">처음</span></a>
			<a href="#" class="pre" title="이전"><span class="blind">이전</span></a>
			<a href="#">11</a>
			<strong>12</strong>
			<a href="#">13</a>
			<a href="#" class="next" title="다음"><span class="blind">다음</span></a>
			<a href="#" class="next_end" title="끝"><span class="blind">끝</span></a>
		</div>
		<!-- //Page Navigation -->
	</div>

	<!-- 오른쪽 컨텐츠 영역 딤드 레이어 -->
	<div id="content_dimmed" style="position:absolute;left:0;top:0;width:100%;height:100%;background:#000;z-index:100;opacity:.3;filter:alpha(opacity=30);display:none;"></div>
	<!-- 오른쪽 컨텐츠 영역 딤드 레이어 //-->
</div>

				<!-- //right Area -->

				<!-- [D] 드레그시 DIM 레이어  -->
				<div class="drag_layer _dropupload">
					<div class="drag_cont">
						<div class="drag_img">
							<img class="left-doodle" src="https://ssl.pstatic.net/static/pwe/ndrive/deskhome/upload_img1.png">
							<img class="right-doodle" src="https://ssl.pstatic.net/static/pwe/ndrive/deskhome/upload_img2.png">
						</div>
						<p class="drag_txt"><span class="blind"><fmt:message key="text.index.dnd.guide" /></span></p>
					</div>
				</div>

			</div>
		</div>

		<!-- 중앙영역 딤드 레이어 -->
		<div id="container_dimmed" style="position:absolute;left:0;top:0;width:100%;height:100%;background:#000;z-index:100;opacity:.3;filter:alpha(opacity=30);display:none;"></div>
		<!-- 중앙영역 딤드 레이어 //-->
	</div>
	<!-- //container -->
	
	



<div id="footer" class="_footer _droparea _no_dimmed" style="z-index:25;">
    <div class="quick_tools">
		<!-- [D] 그래프 가로값은 em태그의 width에 %로 입력 -->
		<a href="https://cloud.naver.com/mycapacity.nhn?openerType=main" target="_blank" class="setup _btn_capacity">환경설정</a>
		<div class="setting_layer _bubblelayer_waste" style="display:none;">
			<p class="sl_txt">이제 마지막으로 본 화면을<br>기본 화면으로 설정해보세요!</p>
			<p class="option_box">
				<span class="chkbx_area">
					<label for="no_sltip">다시보지않기</label>
					<input type="checkbox" class="_no_tip_checkbox" id="no_sltip">
				</span>
			</p>
		</div>
        <span class="bar">|</span>
        <a href="#" class="_btn_skinsetup"><span class="ico_skin"></span>스킨설정</a>
    </div>
    <div class="quick_link">
        <a href="/html/operatePrinciple.ko.html" target="_blank">운영원칙</a>
        <span class="bar">|</span>
        <i class="ic_n">NEW</i>
		<a href="https://cloud.naver.com/notice.nhn" target="_blank" class="_btn_admin">공지사항</a>
        <span class="bar">|</span>
        <a target="_blank" href="https://help.naver.com/support/alias/cloud/cloud9.naver" onclick="clickcr(this,'fot.help','','',event);">고객센터</a>
        <span class="bar">|</span>
        <a target="_blank" href="https://help.naver.com/support/alias/cloud/cloud11.naver" onclick="clickcr(this,'fot.ask','','',event);">결제문의</a>
        <span class="bar">|</span>
	    <a target="_blank" href="https://help.pay.naver.com/mail/form.nhn?alias=checkout_accuse" onclick="clickcr(this,'fot.paytheft','','',event);">결제도용신고</a>
	    <span class="bar">|</span>
        <a href="https://help.naver.com/support/alias/cloud/cloud12.naver" target="_blank" onclick="clickcr(this,'fot.report','','',event);" >신고하기</a>
    </div>
    <h3 class="blind">저작권 및 서브메뉴</h3>
    <address>Copyright ⓒ <a href="http://www.navercorp.com" onclick="clickcr(this,'fot.nhncorp','','',event);" target="_blank">NAVER Corp.</a> All Rights Reserved.</address>
</div>
	
	<div id="notice" class="cho_info _select_info" style="z-index:30;display:none">
		<div class="cho_info"><span class="_selecting_count"></span><span class="bar"></span><a href="#" class="_btn_all_select_cancel">선택해제</a></div>
	</div>
	
	<div class="toast_container _task_msg_toast" style="z-index:31500;display:none">
		<div class="layer_toast">
        <span>
            <span class="txt_box _message"></span>
        </span>
			<button class="cls _close"><span><fmt:message key="word.action.close"/></span></button>
			<span class="bg"></span>
		</div>
	</div>
	<!--  Layer Holder -->
	

<style type="text/css">
	
</style>

<div class="_common">
	<!-- 모바일앱 확대 프로모션 레이어 -->
	<div style="position: absolute; top: 0; left: 0; height: 100%; width: 100%; white-space: nowrap; z-index: 600; text-align: center; display:none;" class="_entry_promo">
	<div style="position: absolute;left:50%;top:50%;z-index:500;margin: -280px 0 0 -360px;width:720px;height:560px;background: url(https://ssl.pstatic.net/static/pwe/cloud/img/promotion/promotion_payment_1812.png) no-repeat">
		<div class="blind">
			<span>EVENT</span>
			<h2>네이버페이 포인트<br><strong>리필 프로모션</strong></h2>
			<p><em>2배로 넓어진 클라우드 용량</em><br>구매하고 최대 80% 포인트 리필 받자!</p>
			<p>1차: 12월 20일부터 1월19까지, 2차: 1월 20일부터 2월 19일까지, 3차: 2월 20일부터 3월 19일까지</p>
			<em>연 상품은 해당되지 않으니 이벤트 내용을 확인해주세요.</em>
		</div>
		<a href="https://campaign.naver.com/npay/refill/" target="_blank" style="position:absolute;bottom:86px;left:113px;width:308px;height:54px;background:none;border:0;padding:0"><span class="blind">이벤트 참여하기</span></a>
		<a href="https://cloud.naver.com/pay/main.nhn#benefit" target="_blank" style="position:absolute;bottom:86px;right:111px;width:182px;height:54px;background:none;border:0;padding:0"><span class="blind">유료 혜택 보기</span></a>
		<!-- 닫기 -->
		<a href="#" class="_close" style="position:absolute;top:33px;right:27px;width:29px;height:29px;background:none;border:0;padding:0">
	    <span class="blind">닫기</span>
	  </a>
		<a href="#" class="_check_close" style="position:absolute;bottom:20px;right:24px;width:84px;height:11px;background:none;border:0;padding:0">
	    <span class="blind">다시 보지 않기</span>
	  </a>
	</div>
</div>

	<!-- //모바일앱 확대 프로모션 레이어 -->
	<div class="transmit_layer _upload" style="position:absolute;z-index:100000"></div>
	<div class="_context_menu" style="z-index:10000"></div>
	<div class="no_view _sorting"></div>
	<div class="layer_tbl _doc_type_layer" id="doc_type_layer" style="display:none;">
		<table cellspacing="0" border="1" summary="문서 유형별 보기 레이어입니다.">
		<caption>문서 유형별 보기 레이어</caption>
		<colgroup><col width="*"></colgroup>
		<tbody>
		<tr>
		<td>
			<ul class="lt_list"><!-- [D] 해상도에 따라 개수가 다르게 노출이 되는데 높이값은 노출개수 * 23 으로 계산하면 됨 -->
			<li class="ico_total on"><a href="#" class="_all"><span class="chk">&nbsp;</span><span class="ico">&nbsp;</span><em class="txt">전체</em></a></li>
			<li class="ico_ndoc _noffice-format"><a href="#" class="_ndoc"><span class="chk">&nbsp;</span><span class="ico">&nbsp;</span><em class="txt">ndoc</em></a></li>
			<li class="ico_nppt _noffice-format"><a href="#" class="_nppt"><span class="chk">&nbsp;</span><span class="ico">&nbsp;</span><em class="txt">nppt</em></a></li>
			<li class="ico_nxls _noffice-format"><a href="#" class="_nxls"><span class="chk">&nbsp;</span><span class="ico">&nbsp;</span><em class="txt">nxls</em></a></li>
			<li class="ico_nfrm _noffice-format"><a href="#" class="_nfrm"><span class="chk">&nbsp;</span><span class="ico">&nbsp;</span><em class="txt">nfrm</em></a></li>
			</ul>
			<ul class="lt_list">
			<li class="ico_doc"><a href="#" class="_word"><span class="chk">&nbsp;</span><span class="ico">&nbsp;</span><em class="txt">doc, docx</em></a></li>
			<li class="ico_hwp"><a href="#" class="_hwp"><span class="chk">&nbsp;</span><span class="ico">&nbsp;</span><em class="txt">hwp</em></a></li>
			<li class="ico_txt"><a href="#" class="_txt"><span class="chk">&nbsp;</span><span class="ico">&nbsp;</span><em class="txt">txt</em></a></li>
			<li class="ico_xls"><a href="#" class="_excel"><span class="chk">&nbsp;</span><span class="ico">&nbsp;</span><em class="txt">xls, xlsx</em></a></li>
			<li class="ico_ppt"><a href="#" class="_ppt"><span class="chk">&nbsp;</span><span class="ico">&nbsp;</span><em class="txt">ppt, pptx</em></a></li>
			<li class="ico_pdf"><a href="#" class="_pdf"><span class="chk">&nbsp;</span><span class="ico">&nbsp;</span><em class="txt">pdf</em></a></li>
			<li class="ico_etc"><a href="#" class="_etc"><span class="chk">&nbsp;</span><span class="ico">&nbsp;</span><em class="txt">기타</em></a></li>
			</ul>
		</td>
		</tr>
		</tbody>
		</table>
	</div>
	<div class="_airswf" style="display:none;">
		<div class="_aircheck"></div>
		<div class="no_view _airUseMessage"></div>
	</div>
	<!-- Play N드라이브 -->
	<div class="play_area _event_play_ndrive" style="display:none;">
		<h2 class="blind_txt">공유 폴더로 나누는 대화!</h2>
		<p class="blind_txt">공유 받은 문서와 사진에 감상평,이야기를 남겨보세요.</p>
		<ol class="blind_txt">
		<li>공유 멤버들과 대화하듯이!</li>
		<li>공유 폴더의 오른쪽에 글쓰기 영역이 나타나며, 등록한 글은 공유 멤버들에게 보여집니다.</li>
		<li>최대 1000자까지 넉넉하게 글을 작성할 수 있습니다.</li>
		</ol>
		<a class="more_pla" href="#">play! 미션시작</a>
		<a class="clse_ly _close1" href="#">닫기</a>
	</div>
	<!-- //Play N드라이브 -->

	<div class="no_view dh_layer _capacity_expired" style="position:relative;width:420px">
		<div class="type_c">
			<div class="wrap_pop" style="width:418px">
			<form action="">
			<fieldset>
			<legend>안내 메세지</legend>
				<div class="content">
					<span class="bu_c">&nbsp;</span>
					<h1><span class="pw_p"><span class="_expiredate">0000년 00월 00일</span></span>에 추가 용량 이용기간이<br> 만료되었습니다. 새로운 이용권을 구입하시거나<br>사용 용량을 30GB이하로 정리해 주세요.</h1>
					<div class="pay_dsc">
						<p>이용 기간 만료 후에도 30GB 이상 용량을 사용하시면<br> 다음과 같이 네이버 클라우드 사용이 제한됩니다.</p>
						<ul>
						<li><span class="bu"></span> 파일 올리기/공유/보내기/다운로드/감상 등 일부 기능 제한</li>
						<li><span class="bu"></span> 탐색기 접속 불가</li>
						</ul>
					</div>
					<div class="desc10"><em>월 1만원에 2TB를 추가해보세요! <a href="#" class="_pay">용량 추가하기</a></em></div>
				</div>
				<div class="footer">
					<button class="_close"><span class="tx">확인</span></button>
				</div>
				<div class="pop_close"><a class="bu_close_p _close" href="#"><span class="blind">닫기</span></a></div>
			</fieldset>
			</form>
			</div>
		</div>
	</div>
	<div class="no_view dh_layer _capacity_over" style="position:relative;width:401px">
		<div class="type_c">
			<div class="wrap_pop" style="width:398px">
			<form action="">
			<fieldset>
			<legend>안내 메세지</legend>
				<div class="content">
					<span class="bu_c">&nbsp;</span>
					<h1>회원님은 현재 <span class="pw_p _usage">150</span>/<span class="_total">130GB</span>를 사용 중입니다.</h1>
					<div class="desc3">용량을 추가하시거나 사용 용량을 <strong class="num _total">130GB</strong>이하로 정리해 주세요.<br>용량 부족으로 올리기가 제한됩니다.</div>
					<div class="desc10"><em>월 1만원에 2TB를 추가해보세요! <a href="#" class="_pay">용량 추가하기</a></em></div>
				</div>
				<div class="footer">
					<button class="_close"><span class="tx">확인</span></button>
				</div>
				<div class="pop_close"><a class="bu_close_p _close" href="#"><span class="blind">닫기</span></a></div>
			</fieldset>
			</form>
			</div>
		</div>
	</div>
	<div id="ndrive_bodysearch_idxfolder_list" class="dh_layer" style="position:absolute;width:467px;display:none;">
		<div class="type_c">
			<div class="wrap_pop">
				<div class="wk_use_layer">
					<div class="wk_use_header">
						<h1><span class="bu bu_folder"></span>본문 검색 사용 중인 폴더</h1>
					</div>
					<div class="transit_tbl_wrap transit_tbl_wrap_v2">
						<div class="transit_tbl_body transit_tbl_body_v2 _list_body"></div>
					</div>
					<p class="wk_use_tip">공유받은 폴더는 마스터가 본문 검색을 설정한 경우에만 본문 검색 가능합니다.</p>
				</div>
				<div class="footer">
					<button style="height:27px" onclick="nhn.NDrive.Layout.BodySearchListViewer.CloseIdxFolderLayer();"><strong class="tx">확인</strong></button>
				</div>
			</div>
		</div>
	</div>
	<div id="alertPayUpgreadeTypeRemove" class="layer_pay_upgrade type_del" style="z-index:999;display:none">
	    <h3 class="ply_tit">용량이 부족해 파일을 삭제하셨나요?<span class="ic"></span></h3>
	    <p class="ply_p">
	        2TB로 용량 업그레이드!!<br/>보다 편리하고, 넉넉하게 사용해보세요.
	    </p>
	    <div class="ply_btn">
	        <a href="#" onclick="window.drive.popup.payCapacity(); clickcr(this,'prm_1tb.delete','','',event); return false;">업그레이드하기</a>
	    </div>
	    <a href="#" class="ply_cls" onclick="ncore.view.hideLayer('alertPayUpgreadeTypeRemove'); return false;">닫기</a>
	</div>
	<div id="alertPayUpgreadeTypeClearBasket" class="layer_pay_upgrade type_basket" style="z-index:999;display:none">
	    <h3 class="ply_tit">용량이 부족한가요?<span class="ic"></span></h3>
	    <p class="ply_p">
	        월 1만원에 2TB를 추가해보세요!<br/>용량 걱정 없이 사용할 수 있습니다.
	    </p>
	    <div class="ply_btn">
	        <a href="#"  onclick="window.drive.popup.payCapacity(); clickcr(this,'prm_1tb.empty','','',event); return false;">업그레이드하기</a>
	    </div>
	    <a href="#" class="ply_cls" onclick="ncore.view.hideLayer('alertPayUpgreadeTypeClearBasket'); return false;">닫기</a>
	</div>
</div>

	<!--  //Layer Holder -->
	<!-- Ajax 상태 알림 레이어 -->
	<div class="_debug_ajax_layer _layer" style="display:none;top:100px;left:100px;width:500px;height:300px;position:absolute;z-index:1000000;border:2px solid red;background-color:white">
		<div class="_drag_area" style="position:relative;height:25px;background-color:yellow;"><b>Ajax Status</b> <button onclick="nhn.NDrive.oApp.exec('ACTION_AJAX_DEBUG_CLOSE')">Close</button></div>
		<div id="ajaxdebug" style="position:relative;border:1px solid blue;height:275px;width:100%;overflow:auto;"></div>
	</div>
	<!-- //Ajax 상태 알림 레이어 -->
	<!-- Send Service -->
	<form id="send2service" onsubmit="return false;" target="_blank" method="post" class="no_view"><input name="servicetype" id="servicetype" type="hidden"><input name="fileinfos" id="fileinfos" type="hidden"><input name="html5Upload" id="html5Upload" type="hidden"></form>
	<!-- //Send Service -->
	<!-- ActiveX Download Directory -->
	<form id="activedownload" onsubmit="return false;" target="_blank" method="get" class="no_view"><input type=text name="directory" id="activedownload_directory" value="C:\NDDown\"></form>
	<!-- //ActiveX Download Directory -->
</div>

<div class="fixed_layer_bottom _buttom_fixed_layer"></div>









	<script type="text/javascript" charset="UTF-8" src="https://fe.cloud.naver.net/static/release/main-part1.js?20181220140627"></script>
	<script type="text/javascript" charset="UTF-8" src="https://fe.cloud.naver.net/static/release/main-part2.js?20181220140627"></script>







	<script type="text/javascript" charset="UTF-8" src="https://fe.cloud.naver.net/static/release/main-launcher.js?20181220140627"></script>
	<script type="text/javascript" charset="UTF-8" src="https://fe.cloud.naver.net/static/bundle/main.js?20181220140627"></script>
	<script type="text/javascript" charset="UTF-8" src="https://fe.cloud.naver.net/static/bundle/action.js?20181220140627"></script>




<script type="text/javascript" charset="utf-8" src="https://static.nid.naver.com/template/gnb_utf8.nhn?20181220140627"></script>

</body>
</html>
