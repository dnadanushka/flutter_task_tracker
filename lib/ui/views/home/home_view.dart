import 'package:flutter/material.dart';
import 'package:flutter_starter/ui/views/home/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class HomeView extends ViewModelBuilderWidget<HomeViewModel>{
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter starter'),
        actions: [
          IconButton(onPressed: (){
            viewModel.goForm();
          }, icon: const Icon(Icons.assignment_outlined)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '${viewModel.title}',
            ),
            Text(
              viewModel.counter.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          viewModel.incrementCounter();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  viewModelBuilder(BuildContext context) => HomeViewModel(Provider.of(context));

  @override
  void onViewModelReady(HomeViewModel viewModel) => viewModel.init();
}
