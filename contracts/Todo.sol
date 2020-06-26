pragma solidity ^0.5.0;

contract ToDo {
    
    struct Task {
        uint id;
        uint date;
        string content;
        string author;
        bool done;
    }
    
    event TaskCreated(uint id, uint date, string content, string author, bool done);
    
    mapping(uint => Task) public tasks;
    
    uint[] taskIds;
    uint lastTaskId = 1;
    
    modifier tasksExisted(uint _id) {
        if(tasks[_id].id == 0)
        revert();
        _;
    }
    
    function createTask(string memory _content, string memory _author) public {
        lastTaskId++;
        tasks[lastTaskId] = Task(lastTaskId, now, _content, _author, false);
        taskIds.push(lastTaskId);
        emit TaskCreated(lastTaskId, now, _content, _author, false);
    }
    
    function getTask(uint _id) public view tasksExisted(_id) returns(uint, uint, string memory, string memory, bool) {
        return (_id, tasks[_id].date, tasks[_id].content, tasks[_id].author, tasks[_id].done);
    }
    
    function getTaskIds() public view returns(uint[] memory) {
        return taskIds;
    }
    
}