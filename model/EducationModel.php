<?php
include_once('DbConnection.php');

class EducationModel extends DbConnection{
	
	public function __construct(){
		parent::__construct();
	}
	
	
	public function addEditEducation($id,$SeekerId,$CertificateDegreeName,$Major,$SchoolName)
    {  	
	    	$sql = "INSERT INTO `education_table`(`SeekerId`, `CertificateDegreeName`, `Major`, `SchoolName`) 
VALUES ('$SeekerId','$CertificateDegreeName','$Major','$SchoolName')";
	
	        if ($id>0) {
	            $sql = "";
	            
	        }
	        
	        return $this->getConnection()->query($sql);    	
    }
	
}