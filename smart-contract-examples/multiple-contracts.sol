// SPDX-License-Identifier: MIT

pragma solidity 0.8.9;

contract ERC20Token {
    string public name;
    mapping(address => uint256) public balances;

    function mint() public {
        balances[tx.origin]++;

    }
}

contract MyContract {
    
    address payable wallet;
    address public token;

    constructor(address payable _wallet, address _token) {
        wallet = _wallet;
        token = _token;
    }
    
    fallback() external payable {
        buyToken();
    }

    function buyToken() public payable {
        ERC20Token _token = ERC20Token(address(token));
        _token.mint();
        // ERC20Token(address(token)).mint();
        wallet.transfer(msg.value);
    }   

}