//note: Goerli test ERC20 address is 0xBA62BCfcAaFc6622853cca2BE6Ac7d845BC0f2Dc
//forge script ./script/DeployERC20Vesting.s.sol --rpc-url $GOERLI_RPC_URL --private-key $PRIVATE_KEY --broadcast --verify --etherscan-api-key $ETHERSCAN_API_KEY
//contract deployed to Goerli 0x5C32F3A5aFd3F63246edDbdf4de480bc0342f86D

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "../lib/forge-std/src/Script.sol";
import {ERC20Vesting} from "../src/ERC20Vesting.sol";

contract DeployERC20Vesting is Script {
    function run() external returns (ERC20Vesting) {
        address beneficiaryAddress = 0x7Cf2703e09EAE37cf1204Fa2d3A24E0bB03A8c93;
        uint64 startTimestamp = 1693524684;
        uint64 durationMonths = 12;

        vm.startBroadcast();
        ERC20Vesting erc20Vesting = new ERC20Vesting(
            beneficiaryAddress,
            startTimestamp,
            durationMonths
        );
        vm.stopBroadcast();

        return (erc20Vesting);
    }
}
