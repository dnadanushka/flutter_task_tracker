import 'package:flutter/material.dart';
import 'package:flutter_starter/ui/views/home/home_view_model.dart';
import 'package:flutter_starter/ui/widgets/future_widget.dart';
import 'package:flutter_starter/ui/widgets/progress_button.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class HomeView extends ViewModelBuilderWidget<HomeViewModel>{
  const HomeView({Key? key}) : super(key: key);
  


  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(

      body: Center(

        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProgressButton(onPressed: () {
                viewModel.goToTaskTracker();
              }, text: 'Task Tracker', width: 100,),
            ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProgressButton(onPressed: () {
              
            }, text: 'Bugs Tracker', width: 100,),
                  ),
          ],
        )
      ),

    );
  }

  @override
  viewModelBuilder(BuildContext context) => HomeViewModel(Provider.of(context));

  @override
  void onViewModelReady(HomeViewModel viewModel) => viewModel.init();
}
