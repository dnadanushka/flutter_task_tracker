import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/config/router.router.dart';

// TODO : implements with auth wrapper
class SplashViewModel extends BaseViewModel {
  final NavigationService _navigationService = GetIt.I.get();
  SplashViewModel(){}

  void init() async{
      Timer(const Duration(seconds: 3), () async {

        _navigationService.replaceWith(Routes.homeView);

    });
  }

}