module.exports =
    (url) ->
        return if not document?
        link = document.createElement "link"
        link.type = "text/css"
        link.rel = "stylesheet"
        link.href = url
        document.getElementsByTagName("head")[0].appendChild(link)
