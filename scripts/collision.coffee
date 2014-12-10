define [], () ->

    hit : (one, two) ->
        xCollision = one.x < (two.x + two.width) and (one.x + one.width) > two.x
        yCollision = one.y < (two.y + two.height) and (one.y + one.height) > two.y

        return xCollision and yCollision

    moveTo : (mover, blocker, vector) ->
        if vector.x > 0
            mover.x = Math.max(blocker.x - mover.width, mover.x)
        if vector.x < 0
            mover.x = Math.min(blocker.x + blocker.width, mover.x)
        if vector.y > 0
            mover.y = Math.max(blocker.y - mover.height, mover.y)
        if vector.y < 0
            mover.y = Math.min(blocker.y + blocker.height, mover.y)
