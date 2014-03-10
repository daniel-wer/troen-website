define ["jquery", "three", "trackballcontrols"], ($, THREE, TrackballControls) ->

  class TroenScene

    constructor : ->

      container = $("#main-container")

      @camera = new THREE.PerspectiveCamera(45, window.innerWidth / window.innerHeight, 1, 2000)
      @camera.position.z = 10

      @scene = new THREE.Scene()

      ambient = new THREE.AmbientLight(0x202030)
      @scene.add(ambient)

      directionalLight = new THREE.DirectionalLight(0xffeedd)
      directionalLight.position.set(10, 10, 10)
      @scene.add(directionalLight)

      @renderer = new THREE.WebGLRenderer()
      @renderer.setSize(window.innerWidth, window.innerHeight)
      container.append(@renderer.domElement)

      @createTrackballControls()
      @loadBike()

      @animate()

      window.addEventListener('resize', @onWindowResize, false);


    animate : ->

      requestAnimationFrame(=> @animate())
      @controls.update()


    render : ->

      @renderer.render(@scene, @camera)


    createTrackballControls : ->

      controls = new THREE.TrackballControls(@camera)

      controls.rotateSpeed = 1.0
      controls.zoomSpeed = 1.2
      controls.panSpeed = 0.8

      controls.noZoom = false
      controls.noPan = true

      controls.staticMoving = true
      controls.dynamicDampingFactor = 0.3

      controls.keys = [65, 83, 68]

      controls.addEventListener('change', => @render() )

      @controls = controls


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
        @render()
      )


    onWindowResize : ->

      @camera.aspect = window.innerWidth / window.innerHeight
      @camera.updateProjectionMatrix()

      @renderer.setSize(window.innerWidth, window.innerHeight)

      @controls.handleResize();

      @render()