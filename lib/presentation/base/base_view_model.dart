abstract class BaseViewModel extends BaseViewModelInputs {
  // shared functions and variables that will be used through any view model.
}

abstract class BaseViewModelInputs extends BaseViewModelOutputs {
  void start(); // start view model job

  void dispose(); // will be called when view model dies
}

abstract class BaseViewModelOutputs {
  // will be implemented later
}
