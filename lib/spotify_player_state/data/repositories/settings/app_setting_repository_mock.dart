import 'package:challenge/spotify_player_state/data/repositories/settings/app_setting_repository.dart';
import 'package:challenge/spotify_player_state/model/settings/app_settings.dart';

class AppSettingRepositoryMock implements AppSettingRepository {
  List<AppSettings> _appSettings = [
    AppSettings(themeColor: ThemeColor.blue),
    AppSettings(themeColor: ThemeColor.green),
    AppSettings(themeColor: ThemeColor.pink),
  ];

  late AppSettings _currentAppSettings = _appSettings.first;

  @override
  Future<AppSettings> load() async {
    return _currentAppSettings;
  }

  @override
  Future<void> save(AppSettings settings) async {
    _currentAppSettings = settings;
    print('Current App Settings is: ${_currentAppSettings.themeColor}');
  }
}
