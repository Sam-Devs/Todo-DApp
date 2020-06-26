pragma solidity >=0.5.0 <=0.6.0;

contract NewTodo {

    struct Task {
        uint id;
        uint time;
        string content;
        string author;
        bool done
    };

    uint [] taskId;
    uint lastTaskIds = 0;

    mapping (uint => Task) public tasks;

    modifier taskExisted(uint _id) {
        if (tasks[_id].id == 0) {
            revert();
            _;
        }
    }

    function createTask(string memory _content, string memory _author) public {
        lastTaskIds++;
        tasks[lastTaskIds] = Task(lastTaskIds, now, _content, _author, false);
        taskId.push(lastTaskIds);
    }

    function getTask(uint _id) public view taskExisted(_id) returns(uint, uint, string, string, bool) {
        return (_id, tasks[_id].time, tasks[_id].date, tasks[_id].content, tasks[_id].author, tasks[_id].done);
    }

    function getTaskIds() public view view returns(uint [] memory) {
        return taskId;
    }
}