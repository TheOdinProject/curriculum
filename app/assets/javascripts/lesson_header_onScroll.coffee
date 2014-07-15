window.lesson = {}

window.lesson.applyScrollEffect = (classList, options) ->
    @prevST = 0
    @scrollTimer = null

    if localStorage.getItem('scrollAlertShown')
        $('.scroll-effect-alert').alert('close')
    else
        $('.scroll-effect-alert .close').click(-> localStorage.setItem('scrollAlertShown', 'true'))

    @onHover = ->
        elem.addClass('mouse--enter') for elem in classList
        $('.mouse--enter').hover(
            => @showElems()
            => @hideElems()
        )

    @onHover() if options.showOnHover

    @onScroll = =>
        currentST = $(window).scrollTop()

        # Update classList elements if scroll change > 50px
        if Math.abs(currentST - @prevST) > 50
            if currentST > @prevST
                @hideElems()
            else
                @showElems()
            @prevST = currentST

    @hideElems = ->
        # Prevent onHover() hiding of classList elements if user at top of page
        if $(window).scrollTop() > 0
            elem.removeClass('scroll--up').addClass('scroll--down') for elem in classList

    @showElems = ->
        elem.removeClass('scroll--down').addClass('scroll--up') for elem in classList

    $(window).scroll =>
        clearTimeout(@scrollTimer) if @scrollTimer
        @scrollTimer = setTimeout(@onScroll, 50)
