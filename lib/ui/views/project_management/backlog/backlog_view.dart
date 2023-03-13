import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'backlog_view_model.dart';


class BackLogView extends  ViewModelBuilderWidget<BackLogViewModel>  {
  const BackLogView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, BackLogViewModel viewModel, Widget? child) {
    return const Scaffold(
      body: Center(child: Text('BackLog Screen')),
    );
  }

  @override
  viewModelBuilder(BuildContext context) => BackLogViewModel();

  // @override
  // void onViewModelReady(BackLogViewModel viewModel) => viewModel.init();
}