import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'initial_store.g.dart';

class InitialStore = InitialStoreBase with _$InitialStore;

abstract class InitialStoreBase with Store {
  @observable
  int indexPage = 0;

  PageController pageController = PageController();

  @action
  setPage(int index) {
    indexPage = index;
    pageController.jumpToPage(
      index,
    );
  }
}
