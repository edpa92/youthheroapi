<?php
require_once 'model/UserAccountModel.php';
require_once 'model/SeekerModel.php';
require_once 'model/CompanyModel.php';

    $userO=new UserAccountModel();
    $seekerO=new SeekerModel();
    $compO=new CompanyModel();

    $resp=array();
    $result=NULL;
    
    if (isset($_POST['username']) && isset($_POST['password'])) {     
        
        $result=$userO->Login($_POST['username'],$_POST['password']);

        if (!is_null($result)) {
            $data["uid"]=$result['UserAccountId'];
            $data["uname"]=$result['Username'];
            
            if ($result['UserTypeId']==2) {
                $comp=$compO->getCompanyByUserid($result['UserAccountId']);
                if (!is_null($comp)) {
                    $data["displayname"]=$comp['CompanyName'];
                    $data["accountid"]=$comp['CompanyId'];
                    $data["isseeker"]=FALSE;
                }
            }else{
                $seeker=$seekerO->getSeeker($result['UserAccountId']);
                if (!is_null($seeker)) {
                    $data["displayname"]=$seeker['Firstname']." ".$seeker['Lastname'];
                    $data["accountid"]=$seeker['SeekerId'];
                    $data["isseeker"]=TRUE;
                }
            }
            
        }
        
    }
    
    
    $data["success"]=(!is_null($result));
    array_push($resp,$data);
    echo json_encode($resp);