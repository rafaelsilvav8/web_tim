{{flutter_js}}
{{flutter_build_config}}

const useCanvasKit = true;

const config = {
  renderer: useCanvasKit ? "canvaskit" : "html",
};
_flutter.loader.load({
  config: config,
});