<?php
require_once 'model/UserAccountModel.php';
require_once 'model/SeekerModel.php';
    $userO=new UserAccountModel();
    $seekerO=new SeekerModel();
    
    $resp=array();
    $result=false;
    if (isset($_POST['username']) && isset($_POST['password']) && isset($_POST['usertypeid'])) {
        
        $result=$userO->addUserAccount($_POST['username'],$_POST['password'],$_POST['usertypeid']);
        if ($result) {
            ;
        }
    }
    
    $data["success"]=$result;
    array_push($resp,$data);
    
    echo json_encode($resp);