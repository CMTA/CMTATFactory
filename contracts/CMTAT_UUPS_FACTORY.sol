//SPDX-License-Identifier: MPL-2.0
pragma solidity ^0.8.20;

import {ERC1967Proxy} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";
import {CMTATUpgradeableUUPS} from "../CMTAT/contracts/deployment/CMTATUpgradeableUUPS.sol";
import {Create2} from "@openzeppelin/contracts/utils/Create2.sol";
import {CMTATFactoryInvariant} from "./libraries/CMTATFactoryInvariant.sol";
import {CMTATFactoryBase} from "./libraries/CMTATFactoryBase.sol";


/**
* @notice Factory to deploy CMTAT with a UUPS proxy
* 
*/
contract CMTAT_UUPS_FACTORY is CMTATFactoryBase {
    /**
    * @param logic_ contract implementation, cannot be zero
    * @param factoryAdmin admin
    * @param useCustomSalt_ custom salt with create2 or not
    */
    constructor(address logic_, address factoryAdmin, bool useCustomSalt_) CMTATFactoryBase(logic_, factoryAdmin,useCustomSalt_){}
       
    
    /*//////////////////////////////////////////////////////////////
                            PUBLIC/EXTERNAL FUNCTIONS
    //////////////////////////////////////////////////////////////*/
     /**
     * @notice Deploys a CMTAT token implementation behind a UUPS proxy.
     * @dev 
     * - Uses a deterministic deployment salt to ensure predictable contract addresses.
     * - Deploys an ERC1967Proxy pointing to a new CMTAT implementation.
     * - Calls the CMTAT initializer using the provided `cmtatArgument`.
     * - Restricted to callers with the `CMTAT_DEPLOYER_ROLE`.
     *
     * @param deploymentSaltInput Salt used for deterministic deployment (via CREATE2).
     * @param cmtatArgument Struct containing initializer arguments for the CMTAT contract.
     *
     * @return cmtat The deployed ERC1967Proxy instance pointing to the CMTAT implementation.
     */
    function deployCMTAT(
        bytes32 deploymentSaltInput,
        // CMTAT function initialize
        CMTAT_ARGUMENT calldata cmtatArgument
    ) public virtual onlyRole(CMTAT_DEPLOYER_ROLE) returns(ERC1967Proxy cmtat)   {
        bytes32 deploymentSalt = _checkAndDetermineDeploymentSalt(deploymentSaltInput);
        bytes memory bytecode = _getBytecode(
        // CMTAT function initialize
        cmtatArgument);
        cmtat = _deployBytecode(bytecode,  deploymentSalt);
        
        return cmtat;
    }

    /**
    * @param deploymentSalt salt for the deployment
    * @param cmtatArgument argument for the function initialize
    * @notice get the proxy address depending on a particular salt
    */
    function computedProxyAddress( 
        bytes32 deploymentSalt,
        // CMTAT function initialize
        CMTAT_ARGUMENT calldata cmtatArgument) public virtual view returns (address cmtatProxy) {
        bytes memory bytecode =  _getBytecode(
        // CMTAT function initialize
        cmtatArgument);
        return Create2.computeAddress(deploymentSalt,  keccak256(bytecode), address(this) );
    }

    /*//////////////////////////////////////////////////////////////
                            INTERNAL FUNCTIONS
    //////////////////////////////////////////////////////////////*/

    /**
    * @dev Deploy CMTAT and push the created CMTAT in the list
    */
    function _deployBytecode(bytes memory bytecode, bytes32  deploymentSalt) internal returns (ERC1967Proxy cmtat) {
                    address cmtatAddress = Create2.deploy(0, deploymentSalt, bytecode);
                    cmtat = ERC1967Proxy(payable(cmtatAddress));
                    cmtats[cmtatCounterId] = address(cmtat);
                    emit CMTAT(address(cmtat), cmtatCounterId);
                    ++cmtatCounterId;
                    cmtatsList.push(address(cmtat));
                    return cmtat;
     }

    
    /**
    * @dev return the smart contract bytecode
    */
     function _getBytecode( 
        // CMTAT function initialize
        CMTAT_ARGUMENT calldata cmtatArgument) internal view returns(bytes memory bytecode) {
        bytes memory implementation = abi.encodeWithSelector(
            CMTATUpgradeableUUPS(address(0)).initialize.selector,
                  cmtatArgument.CMTATAdmin,
                    cmtatArgument.ERC20Attributes,
                cmtatArgument.extraInformationAttributes,
                cmtatArgument.engines
        );
        // abi.encode instead of encodePacked because creationCode return a dynamic type (bytes memory)
        bytecode = abi.encode(type(ERC1967Proxy).creationCode,  logic, implementation);
     }
}