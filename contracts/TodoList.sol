pragma solidity ^0.5.0;

contract TodoList {
    uint256 public taskCount = 0; //state variable

    struct Task {
        uint256 id; //unassigned integer, cant be negative
        string content;
        bool completed;
    }

    mapping(uint256 => Task) public tasks; //key value pair like assoc. array or dict or hashmaps

    event TaskCreated(
        uint id,
        string content,
        bool completed
    );

    event TaskCompleted(
        uint id,
        bool completed
    );

    constructor() public {
        //called when the app is run for the first time to create a default task in the TodoList
        createTask("Check out dappuniversity.com");
    }

    function createTask(string memory _content) public {
        taskCount++;
        tasks[taskCount] = Task(taskCount, _content, false); //create a new Task with new id, content passed, and completion state
        //solidity allows users to listen to events. trigger event by the follow
        emit TaskCreated(taskCount, _content, false);
    }

    function toggleCompleted(uint _id) public {
        Task memory _task = tasks[_id]; //declare variable w the type task in memory underscore means its a local variable, not a state variable
        _task.completed = !_task.completed; //toggle completed value
        tasks[_id] = _task; //put it back into the task mapping
        emit TaskCompleted(_id, _task.completed);
    }


}
