pragma solidity ^0.8.0;

contract Animal {
    function speak() public pure virtual returns (string memory) {
        return "Woo";
    }

    function eat(string memory food) public pure virtual;
}

contract Wolf is Animal {
    function eat(string memory food) public pure override {
        require(keccak256(bytes(food)) == keccak256(bytes("meat")), "Wolf doesn't eat that");
    }
}

contract Dog is Animal {
    function eat(string memory food) public pure override {
        require(keccak256(bytes(food)) == keccak256(bytes("meat")) || keccak256(bytes(food)) == keccak256(bytes("plant")), "Dog doesn't eat that");
        require(keccak256(bytes(food)) != keccak256(bytes("chocolate")), "Dog can't eat chocolate");
    }
}
