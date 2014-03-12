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
  
  #new TroenScene()
)