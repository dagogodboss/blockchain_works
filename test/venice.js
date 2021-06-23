const { expect } = require("chai");

describe("Venice Deployment Test", function () {
    it("Should return the right name and symbol", async function () {
        const Venice = await hre.ethers.getContractFactory("Venice");
        const venice = await Venice.deploy("Venice", "VENT");

        await venice.deployed();
        expect(await venice.name()).to.equal("Venice");
        expect(await venice.symbol()).to.equal("VENT");
    });
});

describe('Venice Add Planet Test', () => {
    it("Should return one", async () => {
        const Venice = await hre.ethers.getContractFactory("Venice");
        const venice = await Venice.deploy("Venice", "VENT");

        await venice.deployed();
        const result = await venice.addPlanet("Jutron", "ilamini Dagogo");
        const totalSupply = await venice.totalSupply();
        expect(totalSupply).to.equal(1);
    })
});

describe('List All Planet', () => {
    it('Compare planet List', async () => {
        const Venice = await hre.ethers.getContractFactory("Venice");
        const venice = await Venice.deploy("Venice", "VENT");
        await venice.deployed();
        await venice.addPlanet("JanTon Cum", "ilamini Dagogo")
        await venice.addPlanet("Rain Planet", "ilamini Dagogo")
        await venice.addPlanet("Jun Moon", "ilamini Dagogo")
        const totalSupply = await venice.totalSupply()

        let list
        let result = []

        for (var i = 1; i <= totalSupply; i++) {
            list = await venice.plantFounderList(i - 1)
            result.push(list)
        }
        let expected = ["JanTon Cum/ilamini Dagogo", "Rain Planet/ilamini Dagogo", "Jun Moon/ilamini Dagogo"]
        expect(result.join(',')).to.equal(expected.join(','));
    })
})