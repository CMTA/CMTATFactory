# Solidity API

## CMTAT_BEACON_FACTORY

Factory to deploy beacon proxy

### beacon

```solidity
contract UpgradeableBeacon beacon
```

### constructor

```solidity
constructor(address implementation_, address factoryAdmin, address beaconOwner, bool useCustomSalt_) public
```

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| implementation_ | address | contract implementation |
| factoryAdmin | address | admin |
| beaconOwner | address | owner |
| useCustomSalt_ | bool |  |

### deployCMTAT

```solidity
function deployCMTAT(bytes32 deploymentSaltInput, struct CMTATFactoryInvariant.CMTAT_ARGUMENT cmtatArgument) public returns (contract BeaconProxy cmtat)
```

deploy CMTAT with a beacon proxy

### computedProxyAddress

```solidity
function computedProxyAddress(bytes32 deploymentSalt, struct CMTATFactoryInvariant.CMTAT_ARGUMENT cmtatArgument) public view returns (address)
```

get the proxy address depending on a particular salt

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| deploymentSalt | bytes32 | salt for the deployment |
| cmtatArgument | struct CMTATFactoryInvariant.CMTAT_ARGUMENT | argument for the function initialize |

### implementation

```solidity
function implementation() public view returns (address)
```

get the implementation address from the beacon

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | address | implementation address |

### _deployBytecode

```solidity
function _deployBytecode(bytes bytecode, bytes32 deploymentSalt) internal returns (contract BeaconProxy cmtat)
```

Deploy CMTAT and push the created CMTAT in the list

### _getBytecode

```solidity
function _getBytecode(struct CMTATFactoryInvariant.CMTAT_ARGUMENT cmtatArgument) internal view returns (bytes bytecode)
```

return the smart contract bytecode

## CMTAT_TP_FACTORY

Factory to deploy CMTAT with a transparent proxy

### constructor

```solidity
constructor(address logic_, address factoryAdmin, bool useCustomSalt_) public
```

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| logic_ | address | contract implementation, cannot be zero |
| factoryAdmin | address | admin |
| useCustomSalt_ | bool | custom salt with create2 or not |

### deployCMTAT

```solidity
function deployCMTAT(bytes32 deploymentSaltInput, address proxyAdminOwner, struct CMTATFactoryInvariant.CMTAT_ARGUMENT cmtatArgument) public returns (contract TransparentUpgradeableProxy cmtat)
```

deploy a transparent proxy with a proxy admin contract

### computedProxyAddress

```solidity
function computedProxyAddress(bytes32 deploymentSalt, address proxyAdminOwner, struct CMTATFactoryInvariant.CMTAT_ARGUMENT cmtatArgument) public view returns (address)
```

get the proxy address depending on a particular salt

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| deploymentSalt | bytes32 | salt for the deployment |
| proxyAdminOwner | address | admin of the proxy |
| cmtatArgument | struct CMTATFactoryInvariant.CMTAT_ARGUMENT | argument for the function initialize |

### _deployBytecode

```solidity
function _deployBytecode(bytes bytecode, bytes32 deploymentSalt) internal returns (contract TransparentUpgradeableProxy cmtat)
```

Deploy CMTAT and push the created CMTAT in the list

### _getBytecode

```solidity
function _getBytecode(address proxyAdminOwner, struct CMTATFactoryInvariant.CMTAT_ARGUMENT cmtatArgument) internal view returns (bytes bytecode)
```

return the smart contract bytecode

## CMTAT_UUPS_FACTORY

Factory to deploy CMTAT with a UUPS proxy

### constructor

```solidity
constructor(address logic_, address factoryAdmin, bool useCustomSalt_) public
```

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| logic_ | address | contract implementation, cannot be zero |
| factoryAdmin | address | admin |
| useCustomSalt_ | bool | custom salt with create2 or not |

### deployCMTAT

```solidity
function deployCMTAT(bytes32 deploymentSaltInput, struct CMTATFactoryInvariant.CMTAT_ARGUMENT cmtatArgument) public returns (contract ERC1967Proxy cmtat)
```

deploy a transparent proxy with a proxy admin contract

### computedProxyAddress

```solidity
function computedProxyAddress(bytes32 deploymentSalt, struct CMTATFactoryInvariant.CMTAT_ARGUMENT cmtatArgument) public view returns (address)
```

get the proxy address depending on a particular salt

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| deploymentSalt | bytes32 | salt for the deployment |
| cmtatArgument | struct CMTATFactoryInvariant.CMTAT_ARGUMENT | argument for the function initialize |

### _deployBytecode

```solidity
function _deployBytecode(bytes bytecode, bytes32 deploymentSalt) internal returns (contract ERC1967Proxy cmtat)
```

Deploy CMTAT and push the created CMTAT in the list

### _getBytecode

```solidity
function _getBytecode(struct CMTATFactoryInvariant.CMTAT_ARGUMENT cmtatArgument) internal view returns (bytes bytecode)
```

return the smart contract bytecode

## CMTATFactoryBase

Code common to TP and UUPS Factory

### logic

```solidity
address logic
```

### constructor

```solidity
constructor(address logic_, address factoryAdmin, bool useCustomSalt_) internal
```

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| logic_ | address | contract implementation |
| factoryAdmin | address | admin |
| useCustomSalt_ | bool |  |

## CMTATFactoryInvariant

List of Invariant (struct, constant, events)

### CMTAT_ARGUMENT

```solidity
struct CMTAT_ARGUMENT {
  address CMTATAdmin;
  struct ICMTATConstructor.ERC20Attributes ERC20Attributes;
  struct ICMTATConstructor.BaseModuleAttributes baseModuleAttributes;
  struct ICMTATConstructor.Engine engines;
}
```

### CMTAT_DEPLOYER_ROLE

```solidity
bytes32 CMTAT_DEPLOYER_ROLE
```

_Role to deploy CMTAT_

### CMTAT

```solidity
event CMTAT(address CMTAT, uint256 id)
```

## CMTATFactoryRoot

Code common to Beacon, TP and UUPS factory

### cmtatsList

```solidity
address[] cmtatsList
```

### useCustomSalt

```solidity
bool useCustomSalt
```

### cmtatCounterId

```solidity
uint256 cmtatCounterId
```

### cmtats

```solidity
mapping(uint256 => address) cmtats
```

mapping

### customSaltUsed

```solidity
mapping(bytes32 => bool) customSaltUsed
```

### constructor

```solidity
constructor(address factoryAdmin, bool useCustomSalt_) internal
```

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| factoryAdmin | address | admin |
| useCustomSalt_ | bool |  |

### CMTATProxyAddress

```solidity
function CMTATProxyAddress(uint256 cmtatCounterId_) external view returns (address)
```

get CMTAT proxy address

### _checkAndDetermineDeploymentSalt

```solidity
function _checkAndDetermineDeploymentSalt(bytes32 deploymentSalt) internal returns (bytes32 saltBytes)
```

_if useCustomSalt is at false, the salt used is the current value of cmtatCounterId_

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| deploymentSalt | bytes32 | salt for deployment |

## FactoryErrors

### CMTAT_Factory_AddressZeroNotAllowedForFactoryAdmin

```solidity
error CMTAT_Factory_AddressZeroNotAllowedForFactoryAdmin()
```

### CMTAT_Factory_AddressZeroNotAllowedForBeaconOwner

```solidity
error CMTAT_Factory_AddressZeroNotAllowedForBeaconOwner()
```

### CMTAT_Factory_AddressZeroNotAllowedForLogicContract

```solidity
error CMTAT_Factory_AddressZeroNotAllowedForLogicContract()
```

### CMTAT_Factory_SaltAlreadyUsed

```solidity
error CMTAT_Factory_SaltAlreadyUsed()
```

