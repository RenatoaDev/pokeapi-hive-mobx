// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$loadingAtom =
      Atom(name: 'HomeStoreBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$errorLoadingAtom =
      Atom(name: 'HomeStoreBase.errorLoading', context: context);

  @override
  bool get errorLoading {
    _$errorLoadingAtom.reportRead();
    return super.errorLoading;
  }

  @override
  set errorLoading(bool value) {
    _$errorLoadingAtom.reportWrite(value, super.errorLoading, () {
      super.errorLoading = value;
    });
  }

  late final _$errorMsgAtom =
      Atom(name: 'HomeStoreBase.errorMsg', context: context);

  @override
  String get errorMsg {
    _$errorMsgAtom.reportRead();
    return super.errorMsg;
  }

  @override
  set errorMsg(String value) {
    _$errorMsgAtom.reportWrite(value, super.errorMsg, () {
      super.errorMsg = value;
    });
  }

  late final _$nextUrlAtom =
      Atom(name: 'HomeStoreBase.nextUrl', context: context);

  @override
  String? get nextUrl {
    _$nextUrlAtom.reportRead();
    return super.nextUrl;
  }

  @override
  set nextUrl(String? value) {
    _$nextUrlAtom.reportWrite(value, super.nextUrl, () {
      super.nextUrl = value;
    });
  }

  late final _$getPokemonsAsyncAction =
      AsyncAction('HomeStoreBase.getPokemons', context: context);

  @override
  Future<void> getPokemons() {
    return _$getPokemonsAsyncAction.run(() => super.getPokemons());
  }

  @override
  String toString() {
    return '''
loading: ${loading},
errorLoading: ${errorLoading},
errorMsg: ${errorMsg},
nextUrl: ${nextUrl}
    ''';
  }
}
