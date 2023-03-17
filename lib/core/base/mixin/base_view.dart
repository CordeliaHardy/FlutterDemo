mixin BaseView {
  void showLoader();

  void hideLoader();

  void showErrorDialog(String errorMessage);

  void showToast(
    String message,
  );
}
