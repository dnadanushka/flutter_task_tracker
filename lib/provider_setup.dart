import 'package:flutter_starter/core/services/gsheets_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
];

List<SingleChildWidget> independentServices = [
  Provider.value(value: GSheetService()),
];

List<SingleChildWidget> dependentServices = [

];