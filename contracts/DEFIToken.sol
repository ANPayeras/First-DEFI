// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract DefiToken {

    //Declarations
    string public name = "DEFi Token";
    string public symbol = "DEFi";
    uint256 public totalSupply = 100000000000000000000000;
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

}