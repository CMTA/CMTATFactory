const { ZeroAddress, keccak256, toUtf8Bytes } = require("ethers");
module.exports = {
  DEFAULT_ADMIN_ROLE:
    '0x0000000000000000000000000000000000000000000000000000000000000000',
  CMTAT_DEPLOYER_ROLE:
    '0x13293a342e85bb7a675992804d0c6194d27d85f90a7401d0666e206fe3b06a03',

  PROXY_UPGRADE_ROLE:
    '0x233d5d22cfc2df30a1764cac21e2207537a3711647f2c29fe3702201f65c1444',
  ZERO_ADDRESS: ZeroAddress,
   extraInformationAttributes:{
    tokenId: "1234567890", // ISIN or identifier
    terms: {
      name: "Token Terms v1",
      uri: "https://cmta.ch/standards/cmta-token-cmtat",
      documentHash: keccak256(toUtf8Bytes("terms-v1"))
    },
    information: "CMTAT smart contract"
  }
}
