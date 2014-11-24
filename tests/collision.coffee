define ["chai", "scripts/collision"], ({expect}, collision) ->
    describe "Collision", ->
        it "should be an object", ->
            expect(collision).to.be.an("object")
        it "should contain a moveTo method", ->
            expect(collision.moveTo).to.be.a("function")
