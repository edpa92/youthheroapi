<?php
include_once('DbConnection.php');

class SeekerModel extends DbConnection{
	
	public function __construct(){
		parent::__construct();
	}
	
	
	public function addSeeker($Id, $Firstname,$Lastname,$Gender,$ContactNumber,$BirthDate,$UserAccountId)
    {  	
	    	$sql = "INSERT INTO `seekerprofile_table`(`Firstname`, `Lastname`, `Gender`, `ContactNumber`, `BirthDate`, `UserAccountId`) 
	    	    VALUES ('$Firstname','$Lastname','$Gender','$ContactNumber','$BirthDate','$UserAccountId')";
	
	        	        
	        return $this->getConnection()->query($sql)?$this->connection->insert_id:0;    	
    }
    
    public function getSeeker($uid)
    {
        $sql = "SELECT `SeekerId`, `Firstname`, `Lastname`, `Gender`, `ContactNumber`, `BirthDate`, `UserAccountId` FROM `seekerprofile_table` WHERE `UserAccountId`='$uid'";
        $queryResult = $this->getConnection()->query($sql);

        if (mysqli_num_rows($queryResult) > 0) {
            return $queryResult->fetch_assoc();
        }

        return null;
    }
}