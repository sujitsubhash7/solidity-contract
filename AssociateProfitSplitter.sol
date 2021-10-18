pragma solidity ^0.5.0;
// lvl 1: equal split
contract AssociateProfitSplitter {
    // @TODO: Create three payable addresses representing `employee_one`, `employee_two` and `employee_three`.
    
    //address payable hr_account = 0xdc214e2b3e6626b2491b1d55CB47Ea1411F642fa;
    
    //address payable employee_one = 0xe672a7211F4b71a2d017105C8de60429896cE270;
    //address payable employee_two = 0x7CBdEa041a3Aa3b80317afD095fd07E0bFC5e661;
    //address payable employee_three = 0x5579313F08b0E8Cc224bD9103C293DDA0920A91A;
    
    address payable employee_one;
    address payable employee_two;
    address payable employee_three;
    
    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
    }

    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        // @TODO: Split `msg.value` into three
        
        uint amount = msg.value / 3; // amount Split between employees
        // require(recipient==employee_one || recipient==employee_two || recipient==employee_three,"check account numbers");
        // @TODO: Transfer the amount to each employee
        // Your code here!
    
        employee_one.transfer(amount);
        employee_two.transfer(amount);
        employee_three.transfer(amount);
        
        // balanceContract = amount(this).balance;

        // @TODO: take care of a potential remainder by sending back to HR (`msg.sender`)
        // Your code here!
        uint change = msg.value - amount*3;
        msg.sender.transfer(change);
        
    }

    function() external payable {
        deposit();
        // @TODO: Enforce that the `deposit` function is called in the fallback function!
        // Your code here!
    }
}
