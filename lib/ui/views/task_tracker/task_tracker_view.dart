import 'package:flutter/material.dart';
import 'package:flutter_starter/ui/views/task_tracker/task_tracker_view_model.dart';
import 'package:flutter_starter/ui/widgets/future_widget.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class TaskTrackerView extends ViewModelBuilderWidget<TaskTrackerViewModel>{
  const TaskTrackerView({Key? key}) : super(key: key);
  


  @override
  Widget builder(BuildContext context, TaskTrackerViewModel viewModel, Widget? child) {
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

        child:  FutureWidget<List<List<String>>>(future: viewModel.getDataFromSheets(),waiting: () => CircularProgressIndicator(),done: (data) {
          return ListView.builder(itemBuilder: ((context, index) {
            return ListTile(leading: Text(data![index][0]),title: Text(data![index][7]),trailing: Text(data![index][6]),);
          }),itemCount: data!.length,);
        },)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          viewModel.goForm();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  viewModelBuilder(BuildContext context) => TaskTrackerViewModel(Provider.of(context));

  @override
  void onViewModelReady(TaskTrackerViewModel viewModel) => viewModel.init();
}
