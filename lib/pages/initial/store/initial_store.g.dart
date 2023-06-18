// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initial_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InitialStore on InitialStoreBase, Store {
  late final _$indexPageAtom =
      Atom(name: 'InitialStoreBase.indexPage', context: context);

  @override
  int get indexPage {
    _$indexPageAtom.reportRead();
    return super.indexPage;
  }

  @override
  set indexPage(int value) {
    _$indexPageAtom.reportWrite(value, super.indexPage, () {
      super.indexPage = value;
    });
  }

  late final _$InitialStoreBaseActionController =
      ActionController(name: 'InitialStoreBase', context: context);

  @override
  dynamic setPage(int index) {
    final _$actionInfo = _$InitialStoreBaseActionController.startAction(
        name: 'InitialStoreBase.setPage');
    try {
      return super.setPage(index);
    } finally {
      _$InitialStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
indexPage: ${indexPage}
    ''';
  }
}
