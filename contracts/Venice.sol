// contracts/Venice.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.7.3;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract Venice is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    string[] public plantFounderList;
    mapping(string => bool) _plantExists;

    constructor(string memory name, string memory symbol)
        ERC721(name, symbol)
    {}

    // So Create A base Ball Player Collection
    function addPlanet(string memory _planetName, string memory _founder)
        public
        returns (uint256)
    {
        require(!_plantExists[_planetName], 'Planet Already Exists');
        // increase counter
        _tokenIds.increment();
        // set the id to this new Planet
        uint256 newItemId = _tokenIds.current();
        // Increase the Planet  Added by User
        _mint(msg.sender, newItemId);
        //Add Planet and Founder to planetFounderList
        plantFounderList.push(string(abi.encodePacked(_planetName, '/', _founder)));
        _plantExists[_planetName] = true;
        return newItemId;
    }
}
