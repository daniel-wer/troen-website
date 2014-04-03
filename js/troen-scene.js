// Generated by CoffeeScript 1.7.1
(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  define(["jquery", "three", "trackballcontrols"], function($, THREE, TrackballControls) {
    var TroenScene;
    return TroenScene = (function() {
      function TroenScene() {
        this.onWindowResize = __bind(this.onWindowResize, this);
        var ambient, container, directionalLight, navbarHeight;
        container = $("#lightcycle-container");
        navbarHeight = $("nav").height();
        this.camera = new THREE.PerspectiveCamera(45, window.innerWidth / (window.innerHeight - navbarHeight), 1, 2000);
        this.camera.position.z = 10;
        this.scene = new THREE.Scene();
        ambient = new THREE.AmbientLight(0x202030);
        this.scene.add(ambient);
        directionalLight = new THREE.DirectionalLight(0xffeedd);
        directionalLight.position.set(10, 10, 10);
        this.scene.add(directionalLight);
        this.renderer = new THREE.WebGLRenderer();
        this.renderer.setSize(window.innerWidth, window.innerHeight - navbarHeight);
        container.append(this.renderer.domElement);
        this.createTrackballControls(container[0]);
        this.loadBike();
        this.animate();
        window.addEventListener('resize', this.onWindowResize, false);
      }

      TroenScene.prototype.animate = function() {
        requestAnimationFrame((function(_this) {
          return function() {
            return _this.animate();
          };
        })(this));
        return this.controls.update();
      };

      TroenScene.prototype.render = function() {
        return this.renderer.render(this.scene, this.camera);
      };

      TroenScene.prototype.createTrackballControls = function(domElement) {
        var controls;
        controls = new THREE.TrackballControls(this.camera, domElement);
        controls.rotateSpeed = 1.0;
        controls.zoomSpeed = 1.2;
        controls.panSpeed = 0.8;
        controls.noZoom = false;
        controls.noPan = true;
        controls.staticMoving = true;
        controls.dynamicDampingFactor = 0.3;
        controls.keys = [65, 83, 68];
        controls.addEventListener('change', (function(_this) {
          return function() {
            return _this.render();
          };
        })(this));
        return this.controls = controls;
      };

      TroenScene.prototype.loadBike = function() {
        var loader, manager;
        manager = new THREE.LoadingManager();
        loader = new THREE.JSONLoader(manager);
        return loader.load('data/cycle/lightcycle.js', (function(_this) {
          return function(geometry) {
            var material, mesh;
            material = new THREE.MeshLambertMaterial();
            mesh = new THREE.Mesh(geometry, material);
            mesh.position.set(0, 0, 0);
            _this.scene.add(mesh);
            return _this.render();
          };
        })(this));
      };

      TroenScene.prototype.onWindowResize = function() {
        var navbarHeight;
        navbarHeight = $("nav").height();
        this.camera.aspect = window.innerWidth / (window.innerHeight - navbarHeight);
        this.camera.updateProjectionMatrix();
        this.renderer.setSize(window.innerWidth, window.innerHeight - navbarHeight);
        this.controls.handleResize();
        return this.render();
      };

      return TroenScene;

    })();
  });

}).call(this);

//# sourceMappingURL=troen-scene.map
