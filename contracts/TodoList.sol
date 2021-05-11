pragma solidity ^0.5.0;

contract TodoList {
    uint256 public taskCount = 0; //state variable

    struct Task {
        uint256 id; //unassigned integer, cant be negative
        string content;
        bool completed;
    }

    mapping(uint256 => Task) public tasks; //key value pair like assoc. array or dict or hashmaps

    constructor() public {
        //called when the app is run for the first time to create a default task in the TodoList
        createTask("Check out dappuniversity.com");
    }

    function createTask(string memory _content) public {
        taskCount++;
        tasks[taskCount] = Task(taskCount, _content, false); //create a new Task with new id, content passed, and completion state
    }
}
