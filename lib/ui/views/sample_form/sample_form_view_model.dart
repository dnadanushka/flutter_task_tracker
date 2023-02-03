import 'package:flutter/material.dart';
import 'package:flutter_starter/core/services/gsheets_service.dart';
import 'package:flutter_starter/ui/views/sample_form/sample_controls.dart';
import 'package:stacked/stacked.dart';
import 'package:reactive_forms/reactive_forms.dart' as rf;

class SampleFormModel extends BaseViewModel {
  final GSheetService _gSheetService;

  final formGroup = rf.FormGroup({
    SampleFormControls.project:
        rf.FormControl<String>(validators: [rf.Validators.required]),
    SampleFormControls.date: rf.FormControl<String>(),
    SampleFormControls.workType: rf.FormControl<String>(),
    SampleFormControls.startTime:
        rf.FormControl<String>(validators: [rf.Validators.required]),
    SampleFormControls.endTime:
        rf.FormControl<String>(validators: [rf.Validators.required]),
    SampleFormControls.workUnits: rf.FormControl<String>(),
    SampleFormControls.task: rf.FormControl<String>(),
  });

  SampleFormModel(this._gSheetService);

  void selectDate(BuildContext context) async {
    DateTime? date = DateTime(1900);
    FocusScope.of(context).requestFocus(FocusNode());

    date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));

    debugPrint(date!.toIso8601String());
    formGroup.control(SampleFormControls.date).value = '${date.year}/${date.month}/${date.day}';
  }

    void selectStartTime(BuildContext context) async {
    TimeOfDay? date = TimeOfDay.now();
    FocusScope.of(context).requestFocus(FocusNode());

    date = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
    );

    debugPrint(date!.toString());
    formGroup.control(SampleFormControls.startTime).value = '${date.hour}:${date.minute}';
  }

      void selectEndTime(BuildContext context) async {
    TimeOfDay? date = TimeOfDay.now();
    FocusScope.of(context).requestFocus(FocusNode());

    date = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
    );

    debugPrint(date!.toString());
    formGroup.control(SampleFormControls.endTime).value = '${date.hour}:${date.minute}';
  }

  Future<bool> insertTask() async {
    return _gSheetService.insertRow([
      formGroup.control(SampleFormControls.project).value,
      formGroup.control(SampleFormControls.date).value,
      formGroup.control(SampleFormControls.workType).value,
      formGroup.control(SampleFormControls.startTime).value.toString(),
      formGroup.control(SampleFormControls.endTime).value.toString(),
      formGroup.control(SampleFormControls.workUnits).value.toString(),
      formGroup.control(SampleFormControls.task).value,
    ]);
  }

  init() {}
}
