//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "hardhat/console.sol";

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/presets/ERC20PresetMinterPauser.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract PomToken is ERC20, ERC20Burnable, ERC20Pausable, AccessControl, Ownable {

    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    bytes32 public constant BURNER_ROLE = keccak256("BURNER_ROLE");
    bytes32 public constant FREEZER_ROLE = keccak256("FREEZER_ROLE");

    constructor(uint256 initialSupply) ERC20("PomToken", "POM") {
        _mint(_msgSender(), initialSupply);
        _setupRole(MINTER_ROLE, _msgSender());
        _setupRole(BURNER_ROLE, _msgSender());
        _setupRole(FREEZER_ROLE, _msgSender());
        _setupRole(DEFAULT_ADMIN_ROLE, _msgSender());
    }

    function mintToken(address to, uint256 amount) public {
        require(hasRole(MINTER_ROLE, _msgSender()), "You must have a minter role to mint");
        _mint(to, amount*10**18);
    }

    function burnToken(address from, uint256 amount) public {
        require(hasRole(BURNER_ROLE, _msgSender()), "You must have a burner role to burn");
        _burn(from, amount*10**18);
    }
    
    function freeze() public virtual {
        require(hasRole(FREEZER_ROLE, _msgSender()), "You must have a freezer role to pause");
        _pause();
    }

    function unfreeze() public virtual {
        require(hasRole(FREEZER_ROLE, _msgSender()), "You must have a freezer role to unpause");
        _unpause();
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount) internal virtual override(ERC20, ERC20Pausable) {
        super._beforeTokenTransfer(from, to, amount);
    }
}