<?php
include_once('DbConnection.php');

class EducationModel extends DbConnection{
	
	public function __construct(){
		parent::__construct();
	}
	
	
	public function addEducation($SeekerId,$CertificateDegreeName,$Major,$SchoolName)
    {  	
	    	$sql = "INSERT INTO `education_table`(`SeekerId`, `CertificateDegreeName`, `Major`, `SchoolName`) 
	    	VALUES ('$SeekerId','$CertificateDegreeName','$Major','$SchoolName')";
	
	        
	        return $this->getConnection()->query($sql);    	
    }
    
    public function editEducation($eduid, $SeekerId,$CertificateDegreeName,$Major,$SchoolName)
    {
        $sql = "UPDATE `education_table` SET `SeekerId`='$SeekerId',`CertificateDegreeName`='$CertificateDegreeName',
`Major`='$Major',`SchoolName`='$SchoolName' WHERE `EducationId`='$eduid'";
        
        
        return $this->getConnection()->query($sql);
    }
    
     public function getAllEducationOfSeeker($Seekerid)
    {
        $sql = "SELECT * FROM `education_table` WHERE `SeekerId`='$Seekerid'";
        
        $queryResult = $this->getConnection()->query($sql);
        
        if (mysqli_num_rows($queryResult) > 0) {
            return $queryResult;
        }
        
        return null;
    }
    
	
}