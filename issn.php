<?php

function validIssn($issn) {
  if (strlen($issn) != 9) return false;
  if (substr($issn, 4, 1) != '-') return false;
  // remove hypen and xs, the rest should be numeric
  if (!is_numeric(str_replace(array('-','x'), '', $issn))) return false;
  return true;
}
// we'll always return json
header('Content-Type: application/json');
//ensure we have a valid parameter before continuing
$eissn = $_GET['eissn'];
if (!validIssn($eissn)) {
  echo "ERROR: INVALID ISSN";
  exit();
}
// if the issn is ok, we can continue
// load the application context
$cwd = getcwd();
$index = $cwd . "/index.php";
define('INDEX_FILE_LOCATION', $index);
require('./lib/pkp/includes/bootstrap.inc.php');

//Get config vars
$host = Config::getVar('database', 'host');
$password = Config::getVar('database', 'password');
$user = Config::getVar('database', 'username');
$db = Config::getVar('database', 'name');

//Create connection and execute query
$conn = new mysqli($host, $user, $password, $db);
if ($conn->connect_errno){
  echo "Failed to connect " . $conn->connect_error;
}
$stmt = $conn->prepare("SELECT journals.path FROM journals WHERE journals.journal_id = (SELECT settings.journal_id FROM journal_settings AS settings WHERE settings.setting_name = 'onlineIssn' AND settings.setting_value = ?)");

$stmt->bind_param('s', $eissn);
$stmt->execute();
$stmt->bind_result($path);
$stmt->fetch();

if (!$path) {
  echo "ERROR: ISSN NOT FOUND";
  exit();
}
echo $path;
$stmt->close();
exit();
