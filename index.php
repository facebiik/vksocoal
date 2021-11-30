<?php 
# @*************************************************************************@
# @ @author Mansur Altamirov (Mansur_TL)                                    @
# @ @author_url 1: https://www.instagram.com/mansur_tl                      @
# @ @author_url 2: http://codecanyon.net/user/mansur_tl                     @
# @ @author_email: highexpresstore@gmail.com                                @
# @*************************************************************************@
# @ Upflix - The Ultimate Modern Video Sharing Platform                     @
# @ Copyright (c) 12.07.2020 Upflix. All rights reserved.                   @
# @*************************************************************************@

require_once("core/init.php");

$app_name        = (isset($_GET["app"])) ? $_GET["app"] : "home";
$app_stat        = fetch_or_get($applications[$app_name], false);
$ufx["spa_load"] = fetch_or_get($_GET["spa_load"], false);

if ($app_stat == true) {
	include_once(strf("apps/native/http/%s/content.php",$app_name));

	if (empty($ufx["http_res"])) {
		include_once("apps/native/http/err404/content.php");
	}
} 

else {
	include_once("apps/native/http/err404/content.php");
}

if ($app_name == "admincp") {
	$http_res = ufx_template("admincp/content");
	echo $http_res;
	mysqli_close($mysqli);
	unset($ufx);
}

else if($app_name == "embed") {
	$http_res = ufx_template("embed/content");
	echo $http_res;
	mysqli_close($mysqli);
	unset($ufx);
}

else {
	if ($ufx["spa_load"] == "1") {
		header('Content-Type: application/json');

		$spa_data["status"]    = 200;
		$spa_data["html"]      = $ufx["http_res"];
		$spa_data["json_data"] = array(
			"page_title"       => $ufx["page_title"],
			"page_desc"        => $ufx["page_desc"],
			"page_kw"          => $ufx["page_kw"],
			"pn"               => $ufx["pn"]
		);

		echo json_encode($spa_data, JSON_UNESCAPED_UNICODE|JSON_PRETTY_PRINT);
		mysqli_close($mysqli);
		unset($ufx);
		exit();
	}

	else {
		$http_res = ufx_template("general/content");
		echo $http_res;
		mysqli_close($mysqli);
		unset($ufx);
	}
}