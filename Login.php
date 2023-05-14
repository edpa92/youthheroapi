<?php
require_once 'model/UserAccountModel.php';
require_once 'model/SeekerModel.php';
    $userO=new UserAccountModel();
    $seekerO=new SeekerModel();

    $resp=array();
    $result=false;
    
    if (isset($_POST['username']) && isset($_POST['password']) && $_POST['username']!="" && $_POST['password']!="") {     
        
        $result=$userO->Login($_POST['username'],$_POST['password']);
        if (!is_null($result)) {
            $data["uid"]=$result['UserAccountId'];
            $data["uname"]=$result['Username'];
            $seeker=$seekerO->getSeeker($result['UserAccountId']);
            if (!is_null($seeker)) {
                $data["displayname"]=$seeker['Firstname']." ".$seeker['Lastname'];
                $data["seekerid"]=$seeker['SeekerId'];
            }
        }
        
    }
    
    
    $data["success"]=(!is_null($result));
    array_push($resp,$data);
    echo json_encode($resp);