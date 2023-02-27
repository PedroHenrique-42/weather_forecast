import 'package:flutter_test/flutter_test.dart';
import 'package:weather_forecast/utils/get_icon_asset.dart';
import 'package:weather_forecast/constants/assets_paths_constants.dart';

void main() {
  test(
    "Utils getIconAsset should return sun animation path",
    () {
      String iconAsset = GetIconAsset.getIcon("01d", "Clear");
      expect(iconAsset, AssetsPaths.sunAnimationPath);
    },
  );

  test(
    "Utils getIconAsset should return moon animation path",
    () {
      String iconAsset = GetIconAsset.getIcon("01n", "Clear");
      expect(iconAsset, AssetsPaths.moonAnimationPath);
    },
  );

  test(
    "Utils getIconAsset should return clouds animation path",
    () {
      String iconAsset = GetIconAsset.getIcon("01n", "Clouds");
      expect(iconAsset, AssetsPaths.cloudsAnimationPath);
    },
  );

  test(
    "Utils getIconAsset should return rain animation path",
    () {
      String iconAsset = GetIconAsset.getIcon("01n", "Rain");
      expect(iconAsset, AssetsPaths.rainAnimationPath);
    },
  );

  test(
    "Utils getIconAsset should return thunderstorm animation path",
    () {
      String iconAsset = GetIconAsset.getIcon("01n", "Thunderstorm");
      expect(iconAsset, AssetsPaths.thunderstormAnimationPath);
    },
  );

  test(
    "Utils getIconAsset should return mist animation path",
    () {
      String iconAsset = GetIconAsset.getIcon("50d", "Mist");
      expect(iconAsset, AssetsPaths.mistAnimationPath);
    },
  );

  test(
    "Utils getIconAsset should return mist animation path",
    () {
      String iconAsset = GetIconAsset.getIcon("50n", "Mist");
      expect(iconAsset, AssetsPaths.mistAnimationPath);
    },
  );
}
