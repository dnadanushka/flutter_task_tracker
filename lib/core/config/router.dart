import 'package:flutter_starter/ui/views/home/home_view.dart';
import 'package:flutter_starter/ui/views/sample_form/sample_form_view.dart';
import 'package:flutter_starter/ui/views/splash/splash_view.dart';
import 'package:flutter_starter/ui/views/task_tracker/task_tracker_view.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(routes: [
  AdaptiveRoute(page: SplashView,initial: true),
  AdaptiveRoute(page: HomeView),
  AdaptiveRoute(page: SampleFormView),
  AdaptiveRoute(page: TaskTrackerView)
])

class $Router {}