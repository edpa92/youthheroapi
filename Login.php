<?php
    require_once 'model/UserAccountModel.php';
    $userO=new UserAccountModel();

    $resp=array();
    $result=false;
    
    if (isset($_POST['username']) && isset($_POST['password']) && $_POST['username']!="" && $_POST['password']!="") {     
        
        $result=$userO->Login($_POST['username'],$_POST['password']);
        
    }
    $data["success"]=$result;
    array_push($resp,$data);

    echo json_encode($resp);