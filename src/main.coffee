require.config

  baseUrl : "js/libs/"

  paths :
    "jquery" : "jquery-2.1.0.min"
    "bootstrap" : "bootstrap.min"
    "troen-scene" : "../troen-scene"
    "trackballcontrols" : "trackballcontrols"

  shim :
    "bootstrap" : 
      deps: [ "jquery" ]
    "lodash" :
      exports: "_"
    "three" :
      exports: "THREE"
    "trackballcontrols" :
      deps: [ "three" ]


require(["troen-scene", "lodash", "jquery", "bootstrap"], (TroenScene) ->
  console.log THREE
  
  new TroenScene()
)