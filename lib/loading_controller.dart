typedef Show = bool Function();
typedef Hide = bool Function();

class LoadingController {
  final Show show;
  final Hide hide;

  const LoadingController({
    required this.show,
    required this.hide,
  });
}
