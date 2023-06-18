// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DetailsStore on DetailsStoreBase, Store {
  late final _$loadingAtom =
      Atom(name: 'DetailsStoreBase.loading', context: context);

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
      Atom(name: 'DetailsStoreBase.errorLoading', context: context);

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
      Atom(name: 'DetailsStoreBase.errorMsg', context: context);

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

  late final _$isFavoriteAtom =
      Atom(name: 'DetailsStoreBase.isFavorite', context: context);

  @override
  bool get isFavorite {
    _$isFavoriteAtom.reportRead();
    return super.isFavorite;
  }

  @override
  set isFavorite(bool value) {
    _$isFavoriteAtom.reportWrite(value, super.isFavorite, () {
      super.isFavorite = value;
    });
  }

  @override
  String toString() {
    return '''
loading: ${loading},
errorLoading: ${errorLoading},
errorMsg: ${errorMsg},
isFavorite: ${isFavorite}
    ''';
  }
}
