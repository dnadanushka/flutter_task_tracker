import 'package:flutter_starter/core/config/router.router.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/services/gsheets_service.dart';

class HomeViewModel extends BaseViewModel{

  final NavigationService _navigationService = GetIt.I.get();
  final GSheetService _gSheetService;
  int counter = 0;
  String title = '';
  HomeViewModel(this._gSheetService);

  void incrementCounter() async{
   //await _gSheetService.insertRow(]);
    counter++;
    notifyListeners();
  }

  void goForm(){
    _navigationService.navigateTo(Routes.sampleFormView);
  }

  Future<List<List<String>>> getDataFromSheets()async{
    return await _gSheetService.getValues();
  }

  void init() async {
    getDataFromSheets();
  }

  void goToTaskTracker() {
    _navigationService.navigateTo(Routes.taskTrackerView);
  }

}