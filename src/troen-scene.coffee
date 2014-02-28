define ["jquery", "three"], ($, THREE) ->

  class TroenScene

    constructor : ->

      container = $("#main-container")

      @camera = new THREE.PerspectiveCamera(45, window.innerWidth / window.innerHeight, 1, 2000)
      @camera.position.z = 10

      @mouseX = window.innerWidth / 2
      @mouseY = window.innerHeight / 2

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

      container.on('mousemove', => @mouseMove())

      @loadBike()

      @animate()


    animate : ->

      requestAnimationFrame(=> @animate())
      @render()


    render : ->

      @camera.position.x = -@mouseX / 10
      @camera.position.y = @mouseY / 10

      @camera.lookAt(@scene.position)
      @renderer.render(@scene, @camera)


    mouseMove : (evt) ->

      windowHalfX = window.innerWidth / 2
      windowHalfY = window.innerHeight / 2
      @mouseX = (event.clientX - windowHalfX) / 2
      @mouseY = (event.clientY - windowHalfY) / 2


    loadBike : ->

      manager = new THREE.LoadingManager()

      # texture = new THREE.Texture()

      # loader = new THREE.ImageLoader(manager)
      # loader.load('textures/UV_Grid_Sm.jpg', (image) ->

      #   texture.image = image
      #   texture.needsUpdate = true

      # )

      loader = new THREE.JSONLoader(manager)
      loader.load('data/cycle/lightcycle.js', (geometry) =>

        # object.traverse( (child) ->
        #   if child instanceof THREE.Mesh
        #     child.material.map = texture
        # )

        mesh = new THREE.Mesh(geometry, new THREE.MeshLambertMaterial())
        mesh.position.set(0, 0, 0)
        @scene.add(mesh)

      )
