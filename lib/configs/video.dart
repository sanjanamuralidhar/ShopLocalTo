class Videos{
  static const String Background = "assets/videos/180301_07_B_HongKongIsland_06.mp4";
  static const String Background1 = "assets/videos/waves.mp4";
  static final Videos _instance = Videos._internal();

  factory Videos() {
    return _instance;
  }

  Videos._internal();
}
