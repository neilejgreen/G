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
###
    moveTo : (mover, vector, blocker) ->
        if vector.x and vector.y
            throw new Error "Vector must be up/down or left/right."

        #find the comp and orthoganal dimension (assuming left-right vector)
        #comp will be the limits of the block ??????
        comp =
            mov :
                left : mover.x
                right : mover.x + mover.width
            blk :
                left : blocker.x
                right : blocker.x + blocker.width

        orth =
            mov :
                left : mover.y
                right : mover.y + mover.height
            blk :
                left : blocker.y
                right : blocker.y + blocker.height

        #flip for updown vector
        if vector.y
            [comp, orth] = [orth, comp]

        #No colision possible if the targets don't overlap in the orth direction
        if orth.mov.left > orth.blk.right or orth.mov.right < orth.blk.left
            return vector
###
