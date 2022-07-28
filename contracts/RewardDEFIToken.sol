// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract RewardDEFIToken {

    //Declarations
    string public name = "Reward Token";
    string public symbol = "REW";
    uint256 public totalSupply = 1000000000000000000000000;
    uint8 public decimals = 18;

    // Event for tokens trasnfer from an user
    event Transfer (
        address indexed _from,
        address indexed _to,
        uint256 _value
    );

    // Evento to aprove an operator
    event Approval (
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );

    mapping(address => uint256) public balanceOf; 
    mapping(address => mapping(address => uint)) public allowance; 

    constructor() {
        balanceOf[msg.sender] = totalSupply;
    }

    // Tokens transfer from an user
    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value, "Insuficient Balance");
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    // Allowance function
    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    // Tokens transfer from an specific user
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[_from] >= _value, "Insuficient Balance");
        require(allowance[_from][msg.sender] >= _value, "Insuficient Balance");
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        allowance[_from][msg.sender] -= _value;
        emit Transfer(_from, _to, _value);
        return true;
    }


}