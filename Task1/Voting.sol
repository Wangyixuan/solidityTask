// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Voting {
    // 候选人票数
    mapping(string => uint) private votingData;
    // 候选人名称
    string[] private votingName;
    
    function vote(string memory _name) public {
        uint count = votingData[_name];
        if  (count > 0) {
             votingData[_name] = count++;
        } else {
            votingData[_name] = 1;
            votingName.push(_name);
        }
    }

    function getVotes(string memory _name) public view returns (uint count) {
        return votingData[_name];
    }

    function resetVotes() public {
        for (uint i = 0; i < votingName.length; i++) 
        {
            string memory name = votingName[i];
            votingData[name] = 0;
        }
    }
}