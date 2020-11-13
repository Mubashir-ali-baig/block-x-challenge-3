pragma solidity ^0.7.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract TODO is Ownable{
    uint currId=0;
    uint index=0;
    struct Tasks{
        uint id;
        string name;
        bool active;
    }
    mapping(uint=>Tasks) taskList;
    function addTask(string memory _name) public onlyOwner{
        currId=currId+1;
        
        taskList[index]=(Tasks(currId,_name,true));
        index=index+1;
        
    }
    function changeStatus(uint _index) public onlyOwner{
        if(taskList[_index].active==true){
            taskList[_index].active=false;
        }
        else{
            taskList[_index].active=true;
        }
    }
    function getTasks(uint _index) public view returns(uint,string memory,bool){
        Tasks memory t = taskList[_index];
        return(t.id,t.name,t.active);
    }
    
}