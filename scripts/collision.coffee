define [], () ->

    hit : (one, two) ->

        place = (it) ->
            left : it.x
            right : it.x + it.width
            top : it.y
            bottom : it.y + it.height

        [oneP, twoP] = (place it for it in [one, two])

        xCollision = [oneP.left, oneP.right].some (x) ->
            twoP.left <= x <= twoP.right
        yCollision = [oneP.top, oneP.bottom].some (y) ->
            twoP.top <= y <= twoP.bottom

        xCollision = oneP.left < twoP.right and oneP.right > twoP.left
        yCollision = oneP.top < twoP.bottom and oneP.bottom > twoP.top

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
