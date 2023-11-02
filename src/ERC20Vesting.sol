//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

//install: forge install OpenZeppelin/openzeppelin-contracts --no-commit
import {VestingWallet} from "@openzeppelin/contracts/finance/VestingWallet.sol";

contract ERC20Vesting is VestingWallet {
    uint64 private immutable i_durationMonths;
    uint64 private constant MONTH_SECONDS = (30 days);

    constructor(
        address _beneficiaryAddress,
        uint64 _startTimestamp,
        uint64 _durationMonths
    )
        VestingWallet(
            _beneficiaryAddress,
            _startTimestamp,
            _durationMonths * MONTH_SECONDS
        )
    {
        i_durationMonths = _durationMonths;
    }

    function _vestingSchedule(
        uint256 totalAllocation,
        uint64 timestamp
    ) internal view override returns (uint256) {
        if (timestamp < start()) {
            return 0;
        } else if (timestamp > start() + duration()) {
            return totalAllocation;
        } else {
            uint256 monthsSinceStart = (timestamp - start()) / MONTH_SECONDS; //new line
            return (totalAllocation * monthsSinceStart) / i_durationMonths; //overriden line
        }
    }

    function getMonthsSinceStart() external view returns (uint256) {
        uint256 monthsSinceStart = (block.timestamp - start()) / MONTH_SECONDS;
        return monthsSinceStart;
    }
}
