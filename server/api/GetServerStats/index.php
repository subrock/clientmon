<?

// GetServerStats - Takes an api call and returns xml of success or failsure. If success a session ID is given and must be passed durrning the session. 
date_default_timezone_set('America/Los_Angeles');

// Initiate logging.
function writeToLog($message) {
        $logDate = new DateTime();
        $logDate = $logDate->format("y:m:d h:i:s");
        exec('touch api.log');
        $myfile = fopen("api.log", "a") or die("Unable to open file!");
        $message = "\n".$logDate." ".$message;
        fwrite($myfile, $message);
        //fclose($myfile);
}

writeToLog("Starting GetServerStats.");

// We only accept POST via back channel. Catch a request header from a POST header.
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
writeToLog("POST Request has been made.");
// Get signed key passed. Compare it to the one in key/.
$myfile = fopen("../key/key.pvt", "r") or die("Unable to open file!");
$api_key=trim(fgets($myfile));
$api_sign=$_POST['signiture'];
fclose($myfile);

if (strcmp($api_sign, $api_key) == 0) {
	writeToLog("Signiture keys match.");
	// Database connection information.
	$db_host="localhost";
	$db_user="root";
	$db_password="testme";
	$db_name="ClientMod";

	$auth_user=$_POST['user'];
	$auth_pass=$_POST['password'];

	mysql_connect($db_host,$db_user,$db_password);
	@mysql_select_db($db_name) or die( "Unable to select database");
        $query="select * from ReaderTable where reader_name='".$auth_user."' and reader_password='".$auth_pass."'";
	writeToLog($query);
        $result=mysql_query($query);
        $rp=mysql_result($result,0,"reader_password");
        $rn=mysql_result($result,0,"reader_name");
        $em=mysql_result($result,0,"reader_email");
        $reader_id=mysql_result($result,0,"reader_id");
	writeToLog($reader_id);
	writeToLog($rn);
	writeToLog($rp);
	writeToLog($em);
        if ($rn==$auth_user || $rp==$auth_pass) {
		// Build XML for a Successful response.
		writeToLog("User and password sucessful. Writting success XML.");
		header("Content-type: text/xml");
		$xml = "<?xml version='1.0' standalone='yes'?>";
		$xml = $xml . "<authentication>";
		$xml = $xml . "<result>Sucess</result>";
		$xml = $xml . "<id>".$reader_id."</id>";
		$xml = $xml . "<name>".$rn."</name>";
		$xml = $xml . "<email>".$em."</email>";
		$xml = $xml . "</authentication>";
		echo $xml;
		writeToLog("End authentication.\n$xml\n\n");
                exit;
        } else {
                // Build XML for a Failure response.
		writeToLog("User and password failed. Writting failure XML.");
		header("Content-type: text/xml");
                $xml = "<?xml version='1.0' standalone='yes'?>";
                $xml = $xml . "<authentication>";
                $xml = $xml . "<result>Failure</result>";
                $xml = $xml . "<id></id>";
                $xml = $xml . "<name></name>";
                $xml = $xml . "<email></email>";
                $xml = $xml . "</authentication>";
                echo $xml;
		writeToLog("End authentication.\n$xml\n\n");
                exit;
        } // End response
	writeToLog($xml);
} else {
	// Key compare failed. Redirect to an error page. 
	setcookie("message","Missing API private key.", time() + 300, '/');
	header('Location: ../error.php');
} // End key compare.
} // End post request

setcookie("message","An error has occured. All conditionals failed.", time() + 300, '/');
header('Location: ../error.php');

?>

