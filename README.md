# CMTA Factory

> To use the CMTAT, we recommend the latest audited version, from the [Releases](https://github.com/CMTA/CMTAT/releases) page. Currently, it is the version [v2.3.0](https://github.com/CMTA/CMTAT/releases/tag/v2.3.0)

## Introduction

Factory to deploy CMTAT

# Usage instructions

The instructions below have been tested on Ubuntu 22.04.5 LTS.

## Dependencies

The toolchain includes the following components, where the versions
are the latest ones that we tested: 

- npm 10.2.5
- Hardhat ^2.22.7
- Solidity 0.8.28 (via solc-js)
- Node 20.5.0
- OpenZeppelin Contracts (Node.js module) [v5.2.0](https://github.com/OpenZeppelin/openzeppelin-contracts/releases/tag/v5.2.0) 
- OpenZeppelin Contracts Upgradeable (Node.js module) [v5.2.0](https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/releases/tag/v5.0.2)
- Test: OpenZeppelin Contracts Upgradeable (submodule) [v5.2.0](https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/releases/tag/v5.2.0)


## Installation

- Clone the repository

Clone the git repository, with the option `--recurse-submodules` to fetch the submodules:

`git clone git@github.com:CMTA/CMTAT.git  --recurse-submodules`  

- Node.js version

We recommend to install the [Node Version Manager `nvm`](https://github.com/nvm-sh/nvm) to manage multiple versions of Node.js on your machine. You can then, for example, install the version 20.5.0 of Node.js with the following command: `nvm install 20.5.0`

The file [.nvmrc](../.nvmrc) at the root of the project set the Node.js version. `nvm use`will automatically use this version if no version is supplied on the command line.

- node modules

To install the node modules required by CMTAT, run the following command at the root of the project:

`npm install`



### Hardhat

> To use Hardhat, the recommended way is to use the version installed as
> part of the node modules, via the `npx` command:

`npx hardhat`

Alternatively, you can install Hardhat [globally](https://hardhat.org/hardhat-runner/docs/getting-started):

`npm install -g hardhat` 

See Hardhat's official [documentation](https://hardhat.org) for more information.

## Contract size

You can get the size of the contract by running the following commands.

- Compile the contracts:

```bash
npx hardhat compile
```

- Run the script:

```bash
npm run-script size
```

The script calls the plugin [hardhat-contract-sizer](https://www.npmjs.com/package/hardhat-contract-sizer) with Hardhat.

## Testing

Tests are written in JavaScript by using [web3js](https://web3js.readthedocs.io/en/v1.10.0/) and run **only** with Hardhat as follows:

`npx hardhat test`

To use the global hardhat install, use instead `hardhat test`.

Please see the Hardhat [documentation](https://hardhat.org/tutorial/testing-contracts) for more information about the writing and running of  Hardhat.


## Code style guidelines

We use linters to ensure consistent coding style. If you contribute code, please run this following command: 

For JavaScript:

```bash
npm run-script lint:js 
npm run-script lint:js:fix 
```

For Solidity:

```bash
npm run-script lint:sol  
npm run-script lint:sol:fix
```

## Compilation with solc

```bash
solc --base-path . --include-path ./node_modules/ contracts/CMTAT_STANDALONE.sol
```



## Intellectual property

The code is copyright (c) Capital Market and Technology Association, 2018-2024, and is released under [Mozilla Public License 2.0](./LICENSE.md).
