define [], () ->
    moveTo : (mover, vector, blocker) ->
        if (vector.x is 0) is (vector.y is 0)
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



        return vector
