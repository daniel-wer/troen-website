require.config

  baseUrl : "js/libs/"

  paths :
    "jquery" : "jquery-2.1.0.min"
    "bootstrap" : "bootstrap.min"
    "troen-scene" : "../troen-scene"
    "trackballcontrols" : "trackballcontrols"
    "lightbox" : "lightbox-2.6.min"

  shim :
    "bootstrap" : 
      deps: [ "jquery" ]
    "lodash" :
      exports: "_"
    "three" :
      exports: "THREE"
    "trackballcontrols" :
      deps: [ "three" ]
    "lightbox" :
      deps: [ "jquery" ]


require(["troen-scene", "lodash", "jquery", "bootstrap", "lightbox"], (TroenScene) ->
  console.log THREE

  # lazy initialize the troenScene once the tab was activated
  troenScene = undefined

  $("#cycle-tab").one("shown.bs.tab", (evt) ->
    evt.preventDefault()
    troenScene = new TroenScene() unless troenScene
  )

  # attach tab handler
  scrollToDownload = ->
    aTag = $("#download")
    $('html,body').animate({scrollTop: aTag.offset().top}, 'slow')

  scrollToTop = ->
    $('html,body').animate({scrollTop: 0}, 'slow')

  $("#download-tab").click( ->
    unless $("#home.active").length
      $("#home-tab").tab("show")
      $("#home-tab").one("shown.bs.tab", scrollToDownload)
    else
      scrollToDownload()
  )

  $("#home-tab").click(scrollToTop)
)