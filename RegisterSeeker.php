<?php
    require_once 'model/UserAccountModel.php';
    require_once 'model/SeekerModel.php';
    require_once 'model/EducationModel.php';
    $userO=new UserAccountModel();
    $seekerO=new SeekerModel();
    $eduO=new EducationModel();
    
    $resp=array();
    $result=false;
    $data["msg"]="Fatal Error";
    $allgood=(isset($_POST['username']) && isset($_POST['password'])) &&
    (isset($_POST['usertypeid']) && isset($_POST['firstname'])) &&
    (isset($_POST['lastname']) && isset($_POST['contact'])) &&
    (isset($_POST['gender']) && isset($_POST['major'])) &&
    (isset($_POST['education']) && isset($_POST['dateofbirth'])) &&
    isset($_POST['school']);
    
    if ($allgood) {
        
            if (!$userO->isUserEmailExist($userO->escapeString($_POST['username']))) {
                $pw=password_hash($userO->escapeString($_POST['password']), PASSWORD_DEFAULT);
                $id=$userO->addUserAccount($userO->escapeString($_POST['username']),$pw,$userO->escapeString($_POST['usertypeid']));
            
            if ($id>0) {
                $seekerId=$seekerO->addSeeker(
                    $userO->escapeString($_POST['firstname']), 
                    $userO->escapeString($_POST['lastname']), 
                    $userO->escapeString($_POST['gender']), 
                    $userO->escapeString($_POST['contact']), 
                    $userO->escapeString($_POST['dateofbirth']), 
                    $id);
                
                if ($seekerId>0) {
                    $result=$eduO->addEducation($seekerId, $eduO->escapeString($_POST['education']), $eduO->escapeString($_POST['major'])
                        , $eduO->escapeString($_POST['school']));
                }
                
                $data["msg"]="You have successfully registered, you can now login";
            }
            
        }else {
            
            $data["msg"]="Username already exist!";
        }
            
        
    }else {
        $data["msg"]="Some posted data invalid! ";
    }
    
    $data["success"]=$result;
    array_push($resp,$data);
    
    echo json_encode($resp);
    
    ?>