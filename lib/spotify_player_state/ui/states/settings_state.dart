import 'package:challenge/spotify_player_state/data/repositories/settings/app_setting_repository.dart';
import 'package:flutter/widgets.dart';

import '../../model/settings/app_settings.dart';

class AppSettingsState extends ChangeNotifier {
  final AppSettingRepository appSettingRepository;
  AppSettings? _appSettings;

  AppSettingsState({required this.appSettingRepository}){
    init();
  }

  Future<void> init() async {
    _appSettings = await appSettingRepository.load();
    notifyListeners();
  }

  ThemeColor get theme => _appSettings?.themeColor ?? ThemeColor.blue;

  Future<void> changeTheme(ThemeColor themeColor) async {
    if (_appSettings == null) return;
    _appSettings = _appSettings!.copyWith(themeColor: themeColor);

    notifyListeners();
    appSettingRepository.save(_appSettings!);
  }
}
