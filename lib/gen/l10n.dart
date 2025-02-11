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

  /// `Login to your organization`
  String get login_header {
    return Intl.message(
      'Login to your organization',
      name: 'login_header',
      desc: '',
      args: [],
    );
  }

  /// `E-mail`
  String get email {
    return Intl.message(
      'E-mail',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Mask`
  String get mask {
    return Intl.message(
      'Mask',
      name: 'mask',
      desc: '',
      args: [],
    );
  }

  /// `MAC`
  String get mac {
    return Intl.message(
      'MAC',
      name: 'mac',
      desc: '',
      args: [],
    );
  }

  /// `Online`
  String get online {
    return Intl.message(
      'Online',
      name: 'online',
      desc: '',
      args: [],
    );
  }

  /// `Offline`
  String get offline {
    return Intl.message(
      'Offline',
      name: 'offline',
      desc: '',
      args: [],
    );
  }

  /// `Brand`
  String get brand {
    return Intl.message(
      'Brand',
      name: 'brand',
      desc: '',
      args: [],
    );
  }

  /// `Model`
  String get model {
    return Intl.message(
      'Model',
      name: 'model',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Find`
  String get find {
    return Intl.message(
      'Find',
      name: 'find',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Remove`
  String get remove {
    return Intl.message(
      'Remove',
      name: 'remove',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `No data`
  String get no_data {
    return Intl.message(
      'No data',
      name: 'no_data',
      desc: '',
      args: [],
    );
  }

  /// `No results`
  String get no_results {
    return Intl.message(
      'No results',
      name: 'no_results',
      desc: '',
      args: [],
    );
  }

  /// `Saved`
  String get saved {
    return Intl.message(
      'Saved',
      name: 'saved',
      desc: '',
      args: [],
    );
  }

  /// `An unknown error occurred. Please try again later.`
  String get err_unknown {
    return Intl.message(
      'An unknown error occurred. Please try again later.',
      name: 'err_unknown',
      desc: '',
      args: [],
    );
  }

  /// `Make sure you have access to the internet and refresh the page. If the problem persists, restart the application.`
  String get err_no_internet_desc {
    return Intl.message(
      'Make sure you have access to the internet and refresh the page. If the problem persists, restart the application.',
      name: 'err_no_internet_desc',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection`
  String get err_no_internet {
    return Intl.message(
      'No internet connection',
      name: 'err_no_internet',
      desc: '',
      args: [],
    );
  }

  /// `The email address or password is incorrect. Please try again.`
  String get err_wrong_credentials {
    return Intl.message(
      'The email address or password is incorrect. Please try again.',
      name: 'err_wrong_credentials',
      desc: '',
      args: [],
    );
  }

  /// `This field is required.`
  String get err_empty_field {
    return Intl.message(
      'This field is required.',
      name: 'err_empty_field',
      desc: '',
      args: [],
    );
  }

  /// `Minimum length: {minLength}.`
  String err_too_short(Object minLength) {
    return Intl.message(
      'Minimum length: $minLength.',
      name: 'err_too_short',
      desc: '',
      args: [minLength],
    );
  }

  /// `Only digits and Latin alphabet characters are allowed.`
  String get err_only_chars_and_digits {
    return Intl.message(
      'Only digits and Latin alphabet characters are allowed.',
      name: 'err_only_chars_and_digits',
      desc: '',
      args: [],
    );
  }

  /// `The passwords do not match.`
  String get err_wrong_repeated_password {
    return Intl.message(
      'The passwords do not match.',
      name: 'err_wrong_repeated_password',
      desc: '',
      args: [],
    );
  }

  /// `An account already exists with the same email address but different login details. Log in with the provider associated with this email address.`
  String get err_account_exists_with_different_credential {
    return Intl.message(
      'An account already exists with the same email address but different login details. Log in with the provider associated with this email address.',
      name: 'err_account_exists_with_different_credential',
      desc: '',
      args: [],
    );
  }

  /// `No user found with the given email address.`
  String get err_user_not_found {
    return Intl.message(
      'No user found with the given email address.',
      name: 'err_user_not_found',
      desc: '',
      args: [],
    );
  }

  /// `The password provided is too weak.`
  String get err_weak_password {
    return Intl.message(
      'The password provided is too weak.',
      name: 'err_weak_password',
      desc: '',
      args: [],
    );
  }

  /// `An account already exists with the given email address.`
  String get err_email_already_in_use {
    return Intl.message(
      'An account already exists with the given email address.',
      name: 'err_email_already_in_use',
      desc: '',
      args: [],
    );
  }

  /// `The email address has not been verified.`
  String get err_email_not_verified {
    return Intl.message(
      'The email address has not been verified.',
      name: 'err_email_not_verified',
      desc: '',
      args: [],
    );
  }

  /// `Too many requests. Please try again later.`
  String get err_too_many_requests {
    return Intl.message(
      'Too many requests. Please try again later.',
      name: 'err_too_many_requests',
      desc: '',
      args: [],
    );
  }

  /// `A recent login is required.`
  String get err_requires_recent_login {
    return Intl.message(
      'A recent login is required.',
      name: 'err_requires_recent_login',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email address`
  String get err_invalid_email {
    return Intl.message(
      'Invalid email address',
      name: 'err_invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `Invalid phone number`
  String get err_invalid_phone_number {
    return Intl.message(
      'Invalid phone number',
      name: 'err_invalid_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `The passwords are not the same`
  String get err_password_dont_match {
    return Intl.message(
      'The passwords are not the same',
      name: 'err_password_dont_match',
      desc: '',
      args: [],
    );
  }

  /// `Invalid phone number`
  String get err_wrong_number {
    return Intl.message(
      'Invalid phone number',
      name: 'err_wrong_number',
      desc: '',
      args: [],
    );
  }

  /// `Location permissions not granted. To grant them, go to app settings.`
  String get err_location_denied_forever {
    return Intl.message(
      'Location permissions not granted. To grant them, go to app settings.',
      name: 'err_location_denied_forever',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
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
