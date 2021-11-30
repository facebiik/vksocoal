<?php 
# @*************************************************************************@
# @ @author Mansur Altamirov (Mansur_TL)                                    @
# @ @author_url 1: https://www.instagram.com/mansur_tl                      @
# @ @author_url 2: http://codecanyon.net/user/mansur_tl                     @
# @ @author_email: highexpresstore@gmail.com                                @
# @*************************************************************************@
# @ Upflix - Video Hosting & Sharing PHP Script                             @
# @ Copyright (c) 12.07.2020 Upflix. All rights reserved.                   @
# @*************************************************************************@

require_once("core/init.php");

header('Content-Type: application/json');

$data   = array();
$api    = ((not_empty($_GET["api"])) ? $_GET["api"] : "");
$app    = ((not_empty($_GET["app"])) ? $_GET["app"] : "");
$action = ((not_empty($_GET["action"])) ? $_GET["action"] : "");
$csrf   = true;
$delay  = fetch_or_get($_GET['delay'], 0);
$delay  = (empty($delay)) ? fetch_or_get($_POST['delay'], 0) : $delay;

if ($api == "native") {
	$app_stat = fetch_or_get($applications[$app], false);

	if ($app_stat == true) {
		$req_handler = strf("apps/native/ajax/%s/content.php",$app);
		$errors      = array();
		$hash        = ((not_empty($_GET["hash"])) ? $_GET["hash"] : "");

		if (empty($hash)) {
		    $hash = ((not_empty($_POST["hash"])) ? $_POST["hash"] : "");
		}

		if ($csrf) {
			if (empty($hash) || empty(ufx_verify_csrf_token($hash))) {
		        $data          = array(
		            "status"   => "400",
		            "err_code" => "invalid_csrf_token",
		            "message"  => "ERROR: Invalid or missing CSRF token"
		        );

		        echo json_encode($data, JSON_PRETTY_PRINT);
		        exit();
		    }
	    }

		require_once(ufx_full_path($req_handler));

		if (is_posnum($delay) && $delay <= 5) {
			sleep($delay);
		}

		echo json_encode($data,JSON_UNESCAPED_UNICODE|JSON_PRETTY_PRINT);
		exit();
	}
	else {
		$data          = array(
	        "status"   => "400",
	        "err_code" => "invalid_app_name",
	        "message"  => "ERROR: No handler found for this request"
	    );

	    echo json_encode($data, JSON_PRETTY_PRINT);
	    exit();
	}
}
