import 'package:weather_forecast/constants/assets_paths_constants.dart';

class GetIconAsset {
  static const Map<String, String> _assetIconsNameMap = {
    "01d": AssetsPaths.sunAnimationPath,
    "01n": AssetsPaths.moonAnimationPath,
    "Clouds": AssetsPaths.cloudsAnimationPath,
    "Rain": AssetsPaths.rainAnimationPath,
    "Thunderstorm": AssetsPaths.thunderstormAnimationPath,
    "Snow": AssetsPaths.snowAnimationPath,
    "50d": AssetsPaths.mistAnimationPath,
    "50n": AssetsPaths.mistAnimationPath,
  };

  static String getIcon(String iconId, String weatherState) {
    String iconNameReturned = "";

    _assetIconsNameMap.forEach((key, value) {
      if (key == iconId || key == weatherState) {
        iconNameReturned = value;
      }
    });

    return iconNameReturned;
  }
}