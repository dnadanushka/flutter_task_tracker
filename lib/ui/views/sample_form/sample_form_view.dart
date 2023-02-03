import 'package:flutter/material.dart';
import 'package:flutter_starter/ui/views/sample_form/sample_controls.dart';
import 'package:flutter_starter/ui/views/sample_form/sample_form_view_model.dart';
import 'package:flutter_starter/ui/widgets/progress_button.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';

class SampleFormView extends ViewModelBuilderWidget<SampleFormModel>{
  const SampleFormView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, SampleFormModel viewModel, Widget? child){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample form'),
      ),
      body: SingleChildScrollView(
        child: ReactiveForm(
            formGroup: viewModel.formGroup,
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                     //Date of Birth
                ReactiveTextField(
                    formControlName: SampleFormControls.date,
                    keyboardType: TextInputType.datetime,
                    decoration: const InputDecoration(
                        hintText: "Date"),
                    onTap: (value) {
                      viewModel.selectDate(context);
                    }),
                const SizedBox(
                  height: 20,
                ),
                //Project
                ReactiveTextField(
                  formControlName: SampleFormControls.project,
                  maxLines: 2,
                  decoration: const InputDecoration(
                    hintText: 'Project',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //WorkType
                  ReactiveTextField(
                  formControlName: SampleFormControls.workType,
                  maxLines: 2,
                  decoration: const InputDecoration(
                    hintText: 'Work Type',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //Start Time
                ReactiveTextField(
                    formControlName: SampleFormControls.startTime,
                    keyboardType: TextInputType.datetime,
                    decoration: const InputDecoration(
                        hintText: "Start Time"),
                    onTap: (value) {
                      viewModel.selectStartTime(context);
                    }),
                const SizedBox(
                  height: 20,
                ),
                //End Time
                ReactiveTextField(
                    formControlName: SampleFormControls.endTime,
                    keyboardType: TextInputType.datetime,
                    decoration: const InputDecoration(
                        hintText: "End Time"),
                    onTap: (value) {
                      viewModel.selectEndTime(context);
                    }),
                const SizedBox(
                  height: 20,
                ),
                //Work Units
                ReactiveDropdownField<String>(
                  formControlName: SampleFormControls.workUnits,
                  hint: const Text('Work Units'),
                  items: const [
                    DropdownMenuItem(
                      value: "1",
                      child: Text('1'),
                    ),
                    DropdownMenuItem(
                      value: "2",
                      child: Text('2'),
                    ),
                         DropdownMenuItem(
                      value: "3",
                      child: Text('3'),
                    ),
                  ],
                  onChanged: (_) {
                    // viewModel.changeCallType();
                  },
                ),
                         const SizedBox(
                  height: 20,
                ),
                //Task
                ReactiveTextField(
                    formControlName: SampleFormControls.task,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        hintText: "Task"),
           ),
                const SizedBox(
                  height: 20,
                ),
                ProgressButton(text: 'Add', onPressed: ()async{viewModel.insertTask();}, width: 200)
              ],
            )
        ),
      ),
    );
  }

  @override
  viewModelBuilder(BuildContext context) =>SampleFormModel(Provider.of(context));

  @override
  void onViewModelReady(SampleFormModel viewModel) => viewModel.init();
}