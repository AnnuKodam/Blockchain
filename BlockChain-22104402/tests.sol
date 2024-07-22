// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.7;

contract Payments {
    // Maps address to balance
mapping(address => uint) balances;

// Event emitted when a deposit is made
event Deposit(address indexed from, uint amount);

// Event emitted when a withdrawal is made
event Withdrawal(address indexed to, uint amount);

// Deposits Ether into the contract
function deposit() external payable {
    balances[msg.sender] += msg.value;
    emit Deposit(msg.sender, msg.value);
}

// Withdraws Ether from the contract
function withdraw(uint _amount) external {
    require(balances[msg.sender] >= _amount, "Insufficient balance");
    balances[msg.sender] -= _amount;
    payable(msg.sender).transfer(_amount);
    emit Withdrawal(msg.sender, _amount);
}

// Gets the balance of a given address
function getBalance(address _address) external view returns(uint) {
    return balances[_address];
}

// Gets the address of this contract
function getAddress() external view returns(address) {
    return address(this);
}
}