import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome !'**
  String get welcome;

  /// No description provided for @login_desc.
  ///
  /// In en, this message translates to:
  /// **'We will send you an OTP( one time password ) on the entered mobile number.'**
  String get login_desc;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @verification.
  ///
  /// In en, this message translates to:
  /// **'Verification'**
  String get verification;

  /// No description provided for @verification_code.
  ///
  /// In en, this message translates to:
  /// **'Verification Code'**
  String get verification_code;

  /// No description provided for @verification_desc.
  ///
  /// In en, this message translates to:
  /// **'Enter 6 digits verification code sent to your number'**
  String get verification_desc;

  /// No description provided for @verify_otp.
  ///
  /// In en, this message translates to:
  /// **'Verify Otp'**
  String get verify_otp;

  /// No description provided for @otp_not_fetch.
  ///
  /// In en, this message translates to:
  /// **'still not fetched code?'**
  String get otp_not_fetch;

  /// No description provided for @resend_otp.
  ///
  /// In en, this message translates to:
  /// **'Resend OTP'**
  String get resend_otp;

  /// No description provided for @set_location.
  ///
  /// In en, this message translates to:
  /// **'Tap to set Location'**
  String get set_location;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @view_categories.
  ///
  /// In en, this message translates to:
  /// **'View categories'**
  String get view_categories;

  /// No description provided for @view_all.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get view_all;

  /// No description provided for @word_on_street.
  ///
  /// In en, this message translates to:
  /// **'Word on the Street'**
  String get word_on_street;

  /// No description provided for @hmos_service_desc.
  ///
  /// In en, this message translates to:
  /// **'HMOS services protection program.\nEvery Services request and any doubt please call to us 1234567890 from 7 am to 9 pm'**
  String get hmos_service_desc;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @booking.
  ///
  /// In en, this message translates to:
  /// **'Booking'**
  String get booking;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @my_bookings.
  ///
  /// In en, this message translates to:
  /// **'My Bookings'**
  String get my_bookings;

  /// No description provided for @ongoing.
  ///
  /// In en, this message translates to:
  /// **'OnGoing'**
  String get ongoing;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @reopen_job.
  ///
  /// In en, this message translates to:
  /// **'Reopen Job'**
  String get reopen_job;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @want_reschedule.
  ///
  /// In en, this message translates to:
  /// **'Want Reschedule'**
  String get want_reschedule;

  /// No description provided for @otp.
  ///
  /// In en, this message translates to:
  /// **'OTP'**
  String get otp;

  /// No description provided for @arrial_time.
  ///
  /// In en, this message translates to:
  /// **'Arrival time of your professional'**
  String get arrial_time;

  /// No description provided for @payment_status.
  ///
  /// In en, this message translates to:
  /// **'Payment Status'**
  String get payment_status;

  /// No description provided for @service_items.
  ///
  /// In en, this message translates to:
  /// **'Service Items'**
  String get service_items;

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantity;

  /// No description provided for @add_booking_image.
  ///
  /// In en, this message translates to:
  /// **'Add Booking Image'**
  String get add_booking_image;

  /// No description provided for @rescheduling_booking.
  ///
  /// In en, this message translates to:
  /// **'Rescheduling Booking'**
  String get rescheduling_booking;

  /// No description provided for @cancel_booking.
  ///
  /// In en, this message translates to:
  /// **'Cancel Booking'**
  String get cancel_booking;

  /// No description provided for @service_info.
  ///
  /// In en, this message translates to:
  /// **'Service info'**
  String get service_info;

  /// No description provided for @select_image.
  ///
  /// In en, this message translates to:
  /// **'Select Job Image'**
  String get select_image;

  /// No description provided for @image_desc.
  ///
  /// In en, this message translates to:
  /// **'Click here to upload your images'**
  String get image_desc;

  /// No description provided for @upload.
  ///
  /// In en, this message translates to:
  /// **'Upload'**
  String get upload;

  /// No description provided for @select_datetime.
  ///
  /// In en, this message translates to:
  /// **'Select Date and Time'**
  String get select_datetime;

  /// No description provided for @datetime_desc.
  ///
  /// In en, this message translates to:
  /// **'when would you like your service ?'**
  String get datetime_desc;

  /// No description provided for @reschedule.
  ///
  /// In en, this message translates to:
  /// **'Reschedule'**
  String get reschedule;

  /// No description provided for @cacel_desc.
  ///
  /// In en, this message translates to:
  /// **'Are you sure to cancel this booking ?'**
  String get cacel_desc;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'YES'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'NO'**
  String get no;

  /// No description provided for @reopen.
  ///
  /// In en, this message translates to:
  /// **'Reopen'**
  String get reopen;

  /// No description provided for @give_partner_rating.
  ///
  /// In en, this message translates to:
  /// **'Give Partner Rating'**
  String get give_partner_rating;

  /// No description provided for @notification.
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get notification;

  /// No description provided for @my_profile.
  ///
  /// In en, this message translates to:
  /// **'My Profile'**
  String get my_profile;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @refer_earn.
  ///
  /// In en, this message translates to:
  /// **'Refer & Earn'**
  String get refer_earn;

  /// No description provided for @contact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contact;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @tnc.
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get tnc;

  /// No description provided for @faq.
  ///
  /// In en, this message translates to:
  /// **'FAQ'**
  String get faq;

  /// No description provided for @share_with_frd.
  ///
  /// In en, this message translates to:
  /// **'Share with Friend'**
  String get share_with_frd;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @profile_update.
  ///
  /// In en, this message translates to:
  /// **'Profile Update'**
  String get profile_update;

  /// No description provided for @continue_btn.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continue_btn;

  /// No description provided for @contact_desc.
  ///
  /// In en, this message translates to:
  /// **'If you think wrong or if any trouble you have faced from our side then please make a callback request we will reach to with in 24 hours.'**
  String get contact_desc;

  /// No description provided for @callback_req.
  ///
  /// In en, this message translates to:
  /// **'Raise Callback Request'**
  String get callback_req;

  /// No description provided for @faq_que.
  ///
  /// In en, this message translates to:
  /// **'FAQ Questions'**
  String get faq_que;

  /// No description provided for @faq_ans.
  ///
  /// In en, this message translates to:
  /// **'FAQ Answers'**
  String get faq_ans;

  /// No description provided for @logout_desc.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout ?'**
  String get logout_desc;

  /// No description provided for @job_post.
  ///
  /// In en, this message translates to:
  /// **'Job Post'**
  String get job_post;

  /// No description provided for @categorie.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get categorie;

  /// No description provided for @select_cat_hint.
  ///
  /// In en, this message translates to:
  /// **'Select Category'**
  String get select_cat_hint;

  /// No description provided for @sub_cat.
  ///
  /// In en, this message translates to:
  /// **'Sub Category'**
  String get sub_cat;

  /// No description provided for @select_sub_hint.
  ///
  /// In en, this message translates to:
  /// **'Select Sub Category'**
  String get select_sub_hint;

  /// No description provided for @service.
  ///
  /// In en, this message translates to:
  /// **'Service'**
  String get service;

  /// No description provided for @select_service_hint.
  ///
  /// In en, this message translates to:
  /// **'Select Service'**
  String get select_service_hint;

  /// No description provided for @desc.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get desc;

  /// No description provided for @add_images.
  ///
  /// In en, this message translates to:
  /// **'Add Images'**
  String get add_images;

  /// No description provided for @get_started.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get get_started;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'skip'**
  String get skip;

  /// No description provided for @enter_number_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter number'**
  String get enter_number_hint;

  /// No description provided for @update_location.
  ///
  /// In en, this message translates to:
  /// **'Update Location'**
  String get update_location;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'ADD'**
  String get add;

  /// No description provided for @summary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get summary;

  /// No description provided for @booking_images.
  ///
  /// In en, this message translates to:
  /// **'Booking Images'**
  String get booking_images;

  /// No description provided for @proceed_to_buy.
  ///
  /// In en, this message translates to:
  /// **'Proceed to Buy'**
  String get proceed_to_buy;

  /// No description provided for @login_to_view.
  ///
  /// In en, this message translates to:
  /// **'Login to view your profile'**
  String get login_to_view;

  /// No description provided for @addons.
  ///
  /// In en, this message translates to:
  /// **'AddOns'**
  String get addons;

  /// No description provided for @addons_desc.
  ///
  /// In en, this message translates to:
  /// **'Which include in the Package ?'**
  String get addons_desc;

  /// No description provided for @cart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cart;

  /// No description provided for @note.
  ///
  /// In en, this message translates to:
  /// **'Additional Note'**
  String get note;

  /// No description provided for @apply_coupon.
  ///
  /// In en, this message translates to:
  /// **'Apply Coupon'**
  String get apply_coupon;

  /// No description provided for @item_total.
  ///
  /// In en, this message translates to:
  /// **'Item total'**
  String get item_total;

  /// No description provided for @add_ons.
  ///
  /// In en, this message translates to:
  /// **'Add - Ons'**
  String get add_ons;

  /// No description provided for @discount.
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get discount;

  /// No description provided for @amount_to_be.
  ///
  /// In en, this message translates to:
  /// **'Amount to be paid'**
  String get amount_to_be;

  /// No description provided for @change.
  ///
  /// In en, this message translates to:
  /// **'change'**
  String get change;

  /// No description provided for @coupon.
  ///
  /// In en, this message translates to:
  /// **'Coupon'**
  String get coupon;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @applied.
  ///
  /// In en, this message translates to:
  /// **'Applied'**
  String get applied;

  /// No description provided for @cancel_reasons.
  ///
  /// In en, this message translates to:
  /// **'Cancel Reasons'**
  String get cancel_reasons;

  /// No description provided for @partner_reviews.
  ///
  /// In en, this message translates to:
  /// **'Partner Reviews'**
  String get partner_reviews;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
