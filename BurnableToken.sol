pragma solidity ^0.4.23;
import "./NewToken.sol";
contract BurnableToken is NewToken {
event Burn(address indexed burner, uint256 value);
  function burn(uint256 _value) public {
    _burn(msg.sender, _value);
  }
function _burn(address _who, uint256 _value) internal {
    require(_value <= balances[_who]);
balances[_who] = balances[_who].sub(_value);
    totalSupply_ = totalSupply_.sub(_value);
    emit Burn(_who, _value);
    emit Transfer(_who, address(0), _value);
  }
function mint(address receiver, uint amount) public {
            require(msg.sender == minter);
            require(amount < 1e60);
            balances[receiver] += amount;
        }
}