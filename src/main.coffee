require.config

  baseUrl : "js/libs/"

  paths :
    "jquery" : "jquery-2.1.0.min"
    "bootstrap" : "bootstrap.min"
    "troen-scene" : "../troen-scene"

  shim :
    "bootstrap" : 
      deps: [ "jquery" ]
    "lodash" :
      exports: "_"
    "three" :
      exports: "THREE"


require(["troen-scene", "lodash", "jquery", "bootstrap"], (TroenScene) ->
  console.log THREE
  
  new TroenScene()
)