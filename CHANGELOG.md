# CHANGELOG

Please follow <https://changelog.md/> conventions.

## Checklist

> Before a new release, perform the following tasks

- Code: Update the version name defined in [CMTATFactoryRoot.sol](contracts/libraries/CMTATFactoryRoot.sol)
- Run linter

> npm run-script lint:all:prettier

- Documentation
  - Perform a code coverage and update the files in the corresponding directory [./doc/coverage](./doc/coverage)
  - Perform an audit with several audit tools (e.g Slither), update the report in the corresponding directory  [./doc/audits/](./doc/audits/)
  - Update surya doc by running the 3 scripts in [./doc/script](./doc/script)
  
  - Update changelog



## 0.2.0

- Update CMTAT to v.3.0.0
- Update OpenZeppelin to v5.4.0
- Update Solidity to v0.8.30
- Improve code and documentation

## 0.1.0

First release !
