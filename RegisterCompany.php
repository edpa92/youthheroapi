<?php
    require_once 'model/UserAccountModel.php';
    require_once 'model/CompanyModel.php';
    $compO=new CompanyModel();
    $userO=new UserAccountModel();
    
    $resp=array();
    $result=false;
    $data["msg"]="Fatal Error";
    
    if (isset($_POST['email']) && isset($_POST['password']) && isset($_POST['companyname'])) {
        
        if (!$userO->isUserEmailExist($userO->escapeString($_POST['email']))) {
            
            $pw=password_hash($userO->escapeString($_POST['password']), PASSWORD_DEFAULT);
            $uid=$userO->addUserAccount($userO->escapeString($_POST['email']),$pw,2);
            if ($uid>0) {
                
            $result=$compO->addCompany($compO->escapeString($_POST['companyname']), 
                $compO->escapeString($_POST['description']), 
                $compO->escapeString($_POST['website']), 
                $uid);
            
            $data["msg"]="You have successfully registered, you can now login";
            }
            
        }else {           
            
            $data["msg"]="Username/Email already exist/used!";
        }
            
    }
    
    $data["success"]=$result;
    array_push($resp,$data);
    
    echo json_encode($resp);