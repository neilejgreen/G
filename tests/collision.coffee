define ["chai", "scripts/collision"], ({expect}, collision) ->

    describe "Collision", ->
        it "should be an object", ->
            expect(collision).to.be.an("object")
        it "should contain a hit method", ->
            expect(collision.hit).to.be.a("function")
        it "should contain a moveTo method", ->
            expect(collision.moveTo).to.be.a("function")
    describe "hit", ->
        it "should return false for non-overlapping rectangles",  ->
            one = {x:1, y:1, width:1, height:1}
            two = {x:3, y:3, width:1, height:1}
            expect(collision.hit one, two).to.be.false

        it "should return true for overlapping rectangles",  ->
            one = {x:1, y:1, width:2.5, height:2.5}
            two = {x:3, y:3, width:1, height:1}
            expect(collision.hit one, two).to.be.true
        it "should return true for matching rectangles", ->
            one = {x:1, y:1, width:1, height:1}
            expect(collision.hit one, one).to.be.true
        it "should return false for adjacent rectangles", ->
            one = {x:1, y:1, width:1, height:1}
            two = {x:1, y:2, width:1, height:1}
            expect(collision.hit one, two).to.be.false

    describe "moveTo", ->
        [mover, blocker, vector] = []
        beforeEach ->
            mover = {
                x : 0, y : 0
                width : .2, height : .2
            }
            blocker = {
                x : 1, y : 1
                width : .5, height : .5
            }

        describe "basic moves", ->
            it "should move mover to left edge when moving right", ->
                collision.moveTo mover, blocker, {x:1, y:0}
                expect(mover.x).to.be.equal(blocker.x - mover.width)

            it "should move mover to right edge when moving left", ->
                mover.x = 5
                collision.moveTo mover, blocker, {x:-1, y:0}
                expect(mover.x).to.be.equal(blocker.x + blocker.width)

            it "should move mover to top edge when moving down", ->
                collision.moveTo mover, blocker, {x:0, y:1}
                expect(mover.y).to.be.equal(blocker.y - mover.height)

            it "should move mover to bottom edge when moving up", ->
                mover.y = 5
                collision.moveTo mover, blocker, {x:0, y:-1}
                expect(mover.y).to.be.equal(blocker.y + blocker.height)

        describe "diagonal moves", ->

            it "should move diagonal mover to corner", ->
                collision.moveTo mover, blocker, {x:1,y:1}
                expect([mover.x, mover.y]).to.be.eql([.8, .8])

            it "should not move mover left when vector goes right", ->
                ###
                position mover above blocker, then move down and right
                this simulates a diagonal collision that should not place
                mover left of blocker
                ###
                [mover.x, mover.y] = [1.1, 0.8]
                collision.moveTo mover, blocker, {x:1,y:1}
                expect(mover.x).to.be.equal(1.1)
