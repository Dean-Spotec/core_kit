// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `本地化`
  String get localization {
    return Intl.message(
      '本地化',
      name: 'localization',
      desc: '',
      args: [],
    );
  }

  /// `保存`
  String get save {
    return Intl.message(
      '保存',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `下拉刷新`
  String get pullDownToRefresh {
    return Intl.message(
      '下拉刷新',
      name: 'pullDownToRefresh',
      desc: '',
      args: [],
    );
  }

  /// `释放立即刷新`
  String get releaseToRefresh {
    return Intl.message(
      '释放立即刷新',
      name: 'releaseToRefresh',
      desc: '',
      args: [],
    );
  }

  /// `刷新中...`
  String get refreshing {
    return Intl.message(
      '刷新中...',
      name: 'refreshing',
      desc: '',
      args: [],
    );
  }

  /// `刷新成功`
  String get refreshSucceeded {
    return Intl.message(
      '刷新成功',
      name: 'refreshSucceeded',
      desc: '',
      args: [],
    );
  }

  /// `刷新失败`
  String get refreshFailed {
    return Intl.message(
      '刷新失败',
      name: 'refreshFailed',
      desc: '',
      args: [],
    );
  }

  /// `上拉加载`
  String get pullUpToLoadMore {
    return Intl.message(
      '上拉加载',
      name: 'pullUpToLoadMore',
      desc: '',
      args: [],
    );
  }

  /// `释放立即加载`
  String get releaseToLoadMore {
    return Intl.message(
      '释放立即加载',
      name: 'releaseToLoadMore',
      desc: '',
      args: [],
    );
  }

  /// `加载中...`
  String get loading {
    return Intl.message(
      '加载中...',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `加载成功`
  String get loadSucceeded {
    return Intl.message(
      '加载成功',
      name: 'loadSucceeded',
      desc: '',
      args: [],
    );
  }

  /// `加载失败`
  String get loadFailed {
    return Intl.message(
      '加载失败',
      name: 'loadFailed',
      desc: '',
      args: [],
    );
  }

  /// `没有更多`
  String get noMore {
    return Intl.message(
      '没有更多',
      name: 'noMore',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(
          languageCode: 'zh', scriptCode: 'Hans', countryCode: 'CN'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
