<?php
include_once('DbConnection.php');

class UserAccountModel extends DbConnection{

    public function __construct()
    {
        parent::__construct();
    }

    public function Login($username, $password){
        

        $sql = "SELECT `UserAccountId`, `Username`, `Password`, `LastLogin`, `UserTypeId` FROM `useraccount_table` WHERE `Username`='$username'";
        $query = $this->getConnection()->query($sql);

        if (mysqli_num_rows($query)>0) {
            $row = $query->fetch_assoc();
            
                return password_verify($password, $row["Password"])?$row:NULL;
            
        }

        return null;
    }
    
    public function addUserAccount($Username,$Password,$UserTypeId)
    {  	
	    	$sql = "INSERT INTO `useraccount_table`(`Username`, `Password`, `UserTypeId`) 
	    	VALUES ('$Username','$Password','$UserTypeId')";
	    	
	    	return $this->getConnection()->query($sql)?$this->connection->insert_id:0;
    }
    
    public function isUserEmailExist($email)
    {
        $sql = "SELECT * FROM `useraccount_table` WHERE `Username`='$email'";
        $queryResult = $this->getConnection()->query($sql);

        if (mysqli_num_rows($queryResult) > 0) {
            return TRUE;
        }

        return FALSE;
    }


}
?>