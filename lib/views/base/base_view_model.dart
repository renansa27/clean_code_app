abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {
  // Shared variables and functions that will be used through any view model.

}

abstract class BaseViewModelInputs {
  void start(); // Will be called while initialization of view model.
  void dispose(); // Will be called when view model dies.
}

abstract class BaseViewModelOutputs {}
