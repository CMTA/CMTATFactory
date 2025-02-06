# CMTAT Factory

> This project is not audited
>
> If you want to use this project, perform your own verification or send an email to [admin@cmta.ch](mailto:admin@cmta.ch).

## Introduction

Factory contracts are available to deploy the [CMTAT](https://github.com/CMTA/CMTAT) (solidity version) with a beacon proxy, a transparent proxy or an UUPS proxy.

- [CMTAT_BEACON_FACTORY.sol](./contracts/CMTAT_BEACON_FACTORY.sol)

- [CMTAT_TRANSPARENT_FACTORY.sol](./contracts/CMTAT_TP_FACTORY.sol)
- [CMTAT_UUPS_FACTORY.sol](./contracts/CMTAT_UUPS_FACTORY.sol)

### Beacon Proxy Factory

The factory will use the same beacon for each beacon proxy. This beacon provides the address of the implementation contract, a CMTAT_PROXY contract. If you upgrade the beacon to point to a new implementation, it will change the implementation contract for all beacon proxy.

![factory-Beacon Factory.drawio](./doc/schema/drawio/factory-BeaconFactory.drawio.png)

#### Inheritance

![surya_inheritance_CMTAT_BEACON_FACTORY.sol](./doc/schema/surya_inheritance/surya_inheritance_CMTAT_BEACON_FACTORY.sol.png)

#### Graph

![surya_graph_CMTAT_BEACON_FACTORY.sol](./doc/schema/surya_graph/surya_graph_CMTAT_BEACON_FACTORY.sol.png)

### Transparent Proxy Factory

The factory will use the same implementation for each transparent proxy deployed. Each transparent proxy has its owned proxy admin, deployed inside the constructor of the transparent proxy. Each transparent proxy can upgrade their implementation to a new one independently and without impact on other proxies.

![factory-Transparent Factory.drawio](./doc/schema/drawio/factory-TransparentFactory.drawio.png)

#### Inheritance

 ![surya_inheritance_CMTAT_TP_FACTORY.sol](./doc/schema/surya_inheritance/surya_inheritance_CMTAT_TP_FACTORY.sol.png)

#### Graph

![surya_graph_CMTAT_TP_FACTORY.sol](./doc/schema/surya_graph/surya_graph_CMTAT_TP_FACTORY.sol.png)

### UUPS ProxyFactory

The factory will use the same implementation for each UUPS proxy deployed. Each UUPS proxy can upgrade their implementation to a new one independently and without impact on other proxies.

Contrary to the Transparent Proxy, the logic to upgrade the proxy is situated in the implementation and not in the proxy.

This is the reason whey there is a specific CMTAT contract which includes this logic to use: `CMTAT_PROXY_UUPS`

#### Inheritance

![surya_inheritance_CMTAT_UUPS_FACTORY.sol](./doc/schema/surya_inheritance/surya_inheritance_CMTAT_UUPS_FACTORY.sol.png)

#### Graph

![surya_graph_CMTAT_UUPS_FACTORY.sol](./doc/schema/surya_graph/surya_graph_CMTAT_UUPS_FACTORY.sol.png)

## Usage instructions

### Dependencies

The toolchain includes the following components, where the versions
are the latest ones that we tested: 

- npm 10.2.5
- Hardhat ^2.22.7
- Solidity 0.8.28 (via solc-js)
- Node 20.5.0
- CMTAT [v2.5.1](https://github.com/CMTA/CMTAT/releases/tag/v2.5.1)
- OpenZeppelin Contracts (Node.js module) [v5.2.0](https://github.com/OpenZeppelin/openzeppelin-contracts/releases/tag/v5.2.0) 
- OpenZeppelin Contracts (Node.js module) [v5.2.0](https://github.com/OpenZeppelin/openzeppelin-contracts/releases/tag/v5.2.0) 
- OpenZeppelin Contracts Upgradeable (Node.js module) [v5.2.0](https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/releases/tag/v5.0.2)


### Installation

- Clone the repository

Clone the git repository, with the option `--recurse-submodules` to fetch the submodules:

`git clone git@github.com:CMTA/CMTATFactory.git  --recurse-submodules`  

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

#### Contract size

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

#### Testing

Tests are written in JavaScript by using [web3js](https://web3js.readthedocs.io/en/v1.10.0/) and run **only** with Hardhat as follows:

`npx hardhat test`

To use the global hardhat install, use instead `hardhat test`.

Please see the Hardhat [documentation](https://hardhat.org/tutorial/testing-contracts) for more information about the writing and running of  Hardhat.


#### Code style guidelines

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

## Generate documentation

### [Surya](https://github.com/ConsenSys/surya)

To generate documentation with surya, you can call the three bash scripts in [doc/script](./doc/script)

| Task                 | Script                      | Command exemple                                              |
| -------------------- | --------------------------- | ------------------------------------------------------------ |
| Generate graph       | script_surya_graph.sh       | npx surya graph -i contracts/**/*.sol <br />npx surya graph contracts/CMTAT_TP_FACTORY.sol |
| Generate inheritance | script_surya_inheritance.sh | npx surya inheritance contracts/modules/CMTAT_TP_FACTORY.sol -i <br />npx surya inheritance contracts/modules/CMTAT_TP_FACTORY.sol |
| Generate report      | script_surya_report.sh      | npx surya mdreport -i surya_report.md contracts/modules/CMTAT_TP_FACTORY.sol <br />npx surya mdreport surya_report.md contracts/modules/CMTAT_TP_FACTORY.sol |

In the report, the path for the different files are indicated in absolute. You have to remove the part which correspond to your local filesystem.



### [Coverage](https://github.com/sc-forks/solidity-coverage/)

Code coverage for Solidity smart-contracts, installed as a hardhat plugin

```bash
npm run-script coverage
```



### [Slither](https://github.com/crytic/slither)

Slither is a Solidity static analysis framework written in Python3

```bash
slither .  --checklist --filter-paths "openzeppelin-contracts-upgradeable|openzeppelin-contracts|@openzeppelin|test|CMTAT" > slither-report.md
```



## Further reading

For more details and test scenario, you can read this article on the Taurus blog: [Making CMTAT Tokenization More Scalable and Cost-Effective with Proxy and Factory Contracts](https://www.taurushq.com/blog/cmtat-tokenization-deployment-with-proxy-and-factory/).

This article uses the CMTAT version [2.5.1](https://github.com/CMTA/CMTAT/releases/tag/v2.5.1) when the factory code was still included in the CMTAT repository. The factory code corresponds to the Factory release: 0.1.0

## Intellectual property

The code is copyright (c) Capital Market and Technology Association, 2018-2025, and is released under [Mozilla Public License 2.0](./LICENSE.md).
