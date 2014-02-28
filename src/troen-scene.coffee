define ["jquery", "three"], ($, THREE) ->

  class TroenScene

    constructor : ->

      container = $("#main-container")

      @camera = new THREE.PerspectiveCamera(45, window.innerWidth / window.innerHeight, 1, 2000)
      @camera.position.z = 100

      # scene

      @scene = new THREE.Scene()

      ambient = new THREE.AmbientLight(0x101030)
      @scene.add(ambient)

      directionalLight = new THREE.DirectionalLight(0xffeedd)
      directionalLight.position.set(0, 0, 1)
      @scene.add(directionalLight)

      @renderer = new THREE.WebGLRenderer()
      @renderer.setSize(window.innerWidth, window.innerHeight)
      container.append(@renderer.domElement)

      @loadBike()


    animate : ->

      requestAnimationFrame(@animate)
      @render()


    render : ->

      #@camera.position.x += ( mouseX - @camera.position.x ) * .05
      #@camera.position.y += ( - mouseY - @camera.position.y ) * .05

      @camera.lookAt(@scene.position)

      @renderer.render(@scene, @camera)


    loadBike : ->

      manager = new THREE.LoadingManager()

      manager.onProgress = (item, loaded, total) ->
        console.log(item, loaded, total)

      texture = new THREE.Texture()

      # loader = new THREE.ImageLoader(manager)
      # loader.load('textures/UV_Grid_Sm.jpg', (image) ->

      #   texture.image = image
      #   texture.needsUpdate = true

      # )

      loader = new THREE.ObjectLoader(manager)
      loader.load('data/cycle/HQ_Movie cycle.obj', (object) =>

        object.traverse( (child) ->
          if child instanceof THREE.Mesh
            child.material.map = texture

        )

        object.position.y = - 80
        @scene.add(object)

      )
