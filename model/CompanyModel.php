<?php
    include_once('DbConnection.php');
    
    class CompanyModel extends DbConnection{
        
        public function addCompany($CompanyName,$CompanyDescription,$Website,$UserAccountId, $email)
        {  	            
            $sql = "INSERT INTO `company_table`(`CompanyName`, `CompanyDescription`, `Website`, `UserAccountId`, `Email`)
                VALUES ('$CompanyName','$CompanyDescription','$Website','$UserAccountId', '$email')";           
            
            return $this->getConnection()->query($sql);    	
        }
        
        
        public function editCompany($CompanyId,$CompanyName,$CompanyDescription,$Website,$UserAccountId)
        {
            $sql = "UPDATE `company_table` SET `CompanyId`='[value-1]',
                `CompanyName`='$CompanyName',`CompanyDescription`='$CompanyDescription',`Website`='$Website',`UserAccountId`='$UserAccountId' 
                WHERE `CompanyId`=$CompanyId";
            
            return $this->getConnection()->query($sql);
        }
        
        public function getCompany($id)
        {
            $sql = "SELECT * FROM `company_table` WHERE `CompanyId`='$id'";
            $queryResult = $this->getConnection()->query($sql);
    
            if (mysqli_num_rows($queryResult) > 0) {
                return $queryResult->fetch_assoc();
            }
    
            return null;
        }
        
        public function getCompanyByUserid($uid)
        {
            $sql = "SELECT * FROM `company_table` WHERE `UserAccountId`='$uid'";
            $queryResult = $this->getConnection()->query($sql);
            
            if (mysqli_num_rows($queryResult) > 0) {
                return $queryResult->fetch_assoc();
            }
            
            return null;
        }
        
         public function getCompanyAll()
        {
            $sql = "SELECT * FROM `company_table`";
            
            $queryResult = $this->getConnection()->query($sql);
            
            if (mysqli_num_rows($queryResult) > 0) {
                return $queryResult;
            }
            
            return null;
        }
    }

?>