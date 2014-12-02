define ["chai", "scripts/collision"], ({expect}, collision) ->

    describe "Collision", ->
        it "should be an object", ->
            expect(collision).to.be.an("object")
        it "should contain a hit method", ->
            expect(collision.hit).to.be.a("function")
    describe "hit", ->
        it "should return false for non-overlapping rectangles",  ->
            one = {x:1, y:1, width:1, height:1}
            two = {x:3, y:3, width:1, height:1}
            expect(collision.hit one, two).to.be.equal(false)

        it "should return true for overlapping rectangles",  ->
            one = {x:1, y:1, width:2.5, height:2.5}
            two = {x:3, y:3, width:1, height:1}
            expect(collision.hit one, two).to.be.equal(true)
        it "should return true for matching rectangles", ->
            one = {x:1, y:1, width:1, height:1}
            expect(collision.hit one, one).to.be.equal(true)
        it "should return false for adjacent rectangles", ->
            one = {x:1, y:1, width:1, height:1}
            two = {x:1, y:2, width:1, height:1}
            expect(collision.hit one, two).to.be.equal(false)
###
    describe "moveTo", ->
        [mover, blocker, vector] = []
        before ->
            mover = {
                x : 3.2, y : 2.4
                width : 1.2, height : 1.2
            }
            blocker = {
                x : 5.2, y : 5.8
                width : 1.2, height : 1.2
            }

        describe "block completely misses", ->
            it "Should not change vector", ->
                vector = { x : 1, y : 0}
                collision.moveTo mover, vector, blocker
                expect(result).to.deep.equal(vector)

        describe "block misses by going left to right above the block", ->
            it "Should not change vector", ->
                vector = {x : 8, y : 0}
                result = collision.moveTo mover, vector, blocker
                expect(result).to.deep.equal(vector)

        describe "block misses by going top to bottom left of the block", ->
            it "Should not change vector", ->
                vector = {x : 0, y : 8}
                result = collision.moveTo mover, vector, blocker
                expect(result).to.deep.equal(vector)

        describe "block misses by approaching the blocker not reaching it", ->
            it "Should not change vector", ->
                mover.y = blocker.y
                vector = {x : .2, y : 0}
                result = collision.moveTo mover, vector, blocker
                expect(result).to.deep.equal(vector)

        describe "block collides", ->
            it "Should change vector", ->
                mover.y = blocker.y
                vector = {x : 2, y : 0}
                result = collision.moveTo mover, vector, blocker
                expect(result).to.not.deep.equal(vector)
###
