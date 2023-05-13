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
}