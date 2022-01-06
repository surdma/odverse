// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
import 'OpenZeppelin/openzeppelin-contracts@4.4.1/contracts/token/ERC721/extensions/ERC721URIStorage.sol';
import 'OpenZeppelin/openzeppelin-contracts@4.4.1/contracts/utils/Counters.sol';
//import '@openzeppelin/contracts/token/ERC721/ERC721.sol';
//import '@openzeppelin/contracts/token/ERC1155/ERC1155.sol';
//import '@openzeppelin/contracts/access/Ownable.sol';
//mport '@openzeppelin/contracts/utils/Strings.sol';

contract OdtroVerse is ERC721URIStorage {
  using Counters for Counters.Counter;

  Counters.Counter private _tokenIds;

  mapping(string => bool ) _artExists;

    uint256 public tokenCounter;
    uint256 public constant Price = 1;

  //mapping for token URIs
  mapping (uint256 => string) private _tokenURIs;

  //Base URI
  string private _baseURIextended;

  constructor() ERC721("OdtroVerse", "ODV"){}


  function createVerse(string memory tokenURI, uint amount) public payable returns(uint256){
    require(!_artExists[tokenURI]);
    require(msg.value  >= amount * Price * 1 ether);
    _tokenIds.increment();
    uint256 newArtId = _tokenIds.current();
    _mint(msg.sender, newArtId);
    _setTokenURI(newArtId, tokenURI);
    return newArtId;
  }
  function burn(address account, uint256 tokenId, uint amount) public {
  address operator = _msgSender();
  //uint256 fromBalance = _balances[id][from];
    _burn(tokenId);
  }
  


}
