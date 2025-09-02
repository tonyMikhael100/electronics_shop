import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
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
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
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

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Malak Al-Khaleej'**
  String get appTitle;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @generalSettings.
  ///
  /// In en, this message translates to:
  /// **'General Settings'**
  String get generalSettings;

  /// No description provided for @myOrders.
  ///
  /// In en, this message translates to:
  /// **'My orders'**
  String get myOrders;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @wishlist.
  ///
  /// In en, this message translates to:
  /// **'Wishlist'**
  String get wishlist;

  /// No description provided for @aboutUs.
  ///
  /// In en, this message translates to:
  /// **'About us'**
  String get aboutUs;

  /// No description provided for @logOut.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logOut;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @cart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cart;

  /// No description provided for @favourite.
  ///
  /// In en, this message translates to:
  /// **'Favourite'**
  String get favourite;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search for products...'**
  String get searchHint;

  /// No description provided for @addToCart.
  ///
  /// In en, this message translates to:
  /// **'Add to Cart'**
  String get addToCart;

  /// No description provided for @buyNow.
  ///
  /// In en, this message translates to:
  /// **'Buy Now'**
  String get buyNow;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantity;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @subtotal.
  ///
  /// In en, this message translates to:
  /// **'Sub total'**
  String get subtotal;

  /// No description provided for @shipping.
  ///
  /// In en, this message translates to:
  /// **'Shipping'**
  String get shipping;

  /// No description provided for @checkout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkout;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @payment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get payment;

  /// No description provided for @review.
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get review;

  /// No description provided for @completeOrder.
  ///
  /// In en, this message translates to:
  /// **'Complete order'**
  String get completeOrder;

  /// No description provided for @placeOrder.
  ///
  /// In en, this message translates to:
  /// **'Place Order'**
  String get placeOrder;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @orderPlaced.
  ///
  /// In en, this message translates to:
  /// **'Order placed successfully!'**
  String get orderPlaced;

  /// No description provided for @emptyCart.
  ///
  /// In en, this message translates to:
  /// **'Your cart is empty'**
  String get emptyCart;

  /// No description provided for @emptyWishlist.
  ///
  /// In en, this message translates to:
  /// **'Your wishlist is empty'**
  String get emptyWishlist;

  /// No description provided for @noOrders.
  ///
  /// In en, this message translates to:
  /// **'No orders found'**
  String get noOrders;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAccount;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get welcomeBack;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'العربية'**
  String get arabic;

  /// No description provided for @hello.
  ///
  /// In en, this message translates to:
  /// **'Hello'**
  String get hello;

  /// No description provided for @dealsOfTheDay.
  ///
  /// In en, this message translates to:
  /// **'Deals of the day'**
  String get dealsOfTheDay;

  /// No description provided for @browse.
  ///
  /// In en, this message translates to:
  /// **'Browse'**
  String get browse;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get viewAll;

  /// No description provided for @seeAll.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get seeAll;

  /// No description provided for @popularProducts.
  ///
  /// In en, this message translates to:
  /// **'Popular Products'**
  String get popularProducts;

  /// No description provided for @newArrivals.
  ///
  /// In en, this message translates to:
  /// **'New Arrivals'**
  String get newArrivals;

  /// No description provided for @bestSellers.
  ///
  /// In en, this message translates to:
  /// **'Best Sellers'**
  String get bestSellers;

  /// No description provided for @electronics.
  ///
  /// In en, this message translates to:
  /// **'Electronics'**
  String get electronics;

  /// No description provided for @phones.
  ///
  /// In en, this message translates to:
  /// **'Phones'**
  String get phones;

  /// No description provided for @laptops.
  ///
  /// In en, this message translates to:
  /// **'Laptops'**
  String get laptops;

  /// No description provided for @accessories.
  ///
  /// In en, this message translates to:
  /// **'Accessories'**
  String get accessories;

  /// No description provided for @headphones.
  ///
  /// In en, this message translates to:
  /// **'Headphones'**
  String get headphones;

  /// No description provided for @cameras.
  ///
  /// In en, this message translates to:
  /// **'Cameras'**
  String get cameras;

  /// No description provided for @gaming.
  ///
  /// In en, this message translates to:
  /// **'Gaming'**
  String get gaming;

  /// No description provided for @smartWatch.
  ///
  /// In en, this message translates to:
  /// **'Smart Watch'**
  String get smartWatch;

  /// No description provided for @tablets.
  ///
  /// In en, this message translates to:
  /// **'Tablets'**
  String get tablets;

  /// No description provided for @speakers.
  ///
  /// In en, this message translates to:
  /// **'Speakers'**
  String get speakers;

  /// No description provided for @productDetails.
  ///
  /// In en, this message translates to:
  /// **'Product Details'**
  String get productDetails;

  /// No description provided for @specifications.
  ///
  /// In en, this message translates to:
  /// **'Specifications'**
  String get specifications;

  /// No description provided for @reviews.
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get reviews;

  /// No description provided for @rating.
  ///
  /// In en, this message translates to:
  /// **'Rating'**
  String get rating;

  /// No description provided for @addToWishlist.
  ///
  /// In en, this message translates to:
  /// **'Add to Wishlist'**
  String get addToWishlist;

  /// No description provided for @removeFromWishlist.
  ///
  /// In en, this message translates to:
  /// **'Remove from Wishlist'**
  String get removeFromWishlist;

  /// No description provided for @inStock.
  ///
  /// In en, this message translates to:
  /// **'In Stock'**
  String get inStock;

  /// No description provided for @outOfStock.
  ///
  /// In en, this message translates to:
  /// **'Out of Stock'**
  String get outOfStock;

  /// No description provided for @limitedStock.
  ///
  /// In en, this message translates to:
  /// **'Limited Stock'**
  String get limitedStock;

  /// No description provided for @freeShipping.
  ///
  /// In en, this message translates to:
  /// **'Free Shipping'**
  String get freeShipping;

  /// No description provided for @fastDelivery.
  ///
  /// In en, this message translates to:
  /// **'Fast Delivery'**
  String get fastDelivery;

  /// No description provided for @returnPolicy.
  ///
  /// In en, this message translates to:
  /// **'Return Policy'**
  String get returnPolicy;

  /// No description provided for @warranty.
  ///
  /// In en, this message translates to:
  /// **'Warranty'**
  String get warranty;

  /// No description provided for @customerSupport.
  ///
  /// In en, this message translates to:
  /// **'Customer Support'**
  String get customerSupport;

  /// No description provided for @trackOrder.
  ///
  /// In en, this message translates to:
  /// **'Track Order'**
  String get trackOrder;

  /// No description provided for @orderHistory.
  ///
  /// In en, this message translates to:
  /// **'Order History'**
  String get orderHistory;

  /// No description provided for @orderStatus.
  ///
  /// In en, this message translates to:
  /// **'Order Status'**
  String get orderStatus;

  /// No description provided for @pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pending;

  /// No description provided for @processing.
  ///
  /// In en, this message translates to:
  /// **'Processing'**
  String get processing;

  /// No description provided for @shipped.
  ///
  /// In en, this message translates to:
  /// **'Shipped'**
  String get shipped;

  /// No description provided for @delivered.
  ///
  /// In en, this message translates to:
  /// **'Delivered'**
  String get delivered;

  /// No description provided for @cancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get cancelled;

  /// No description provided for @refunded.
  ///
  /// In en, this message translates to:
  /// **'Refunded'**
  String get refunded;

  /// No description provided for @paymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get paymentMethod;

  /// No description provided for @creditCard.
  ///
  /// In en, this message translates to:
  /// **'Credit Card'**
  String get creditCard;

  /// No description provided for @debitCard.
  ///
  /// In en, this message translates to:
  /// **'Debit Card'**
  String get debitCard;

  /// No description provided for @paypal.
  ///
  /// In en, this message translates to:
  /// **'PayPal'**
  String get paypal;

  /// No description provided for @cashOnDelivery.
  ///
  /// In en, this message translates to:
  /// **'Cash on delivery (COD)'**
  String get cashOnDelivery;

  /// No description provided for @bankTransfer.
  ///
  /// In en, this message translates to:
  /// **'Bank Transfer'**
  String get bankTransfer;

  /// No description provided for @applePay.
  ///
  /// In en, this message translates to:
  /// **'Apple Pay'**
  String get applePay;

  /// No description provided for @googlePay.
  ///
  /// In en, this message translates to:
  /// **'Google Pay'**
  String get googlePay;

  /// No description provided for @shippingAddress.
  ///
  /// In en, this message translates to:
  /// **'Shipping Address'**
  String get shippingAddress;

  /// No description provided for @billingAddress.
  ///
  /// In en, this message translates to:
  /// **'Billing Address'**
  String get billingAddress;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @streetAddress.
  ///
  /// In en, this message translates to:
  /// **'Street Address'**
  String get streetAddress;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @state.
  ///
  /// In en, this message translates to:
  /// **'State'**
  String get state;

  /// No description provided for @zipCode.
  ///
  /// In en, this message translates to:
  /// **'Zip Code'**
  String get zipCode;

  /// No description provided for @country.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// No description provided for @defaultAddress.
  ///
  /// In en, this message translates to:
  /// **'Default Address'**
  String get defaultAddress;

  /// No description provided for @addNewAddress.
  ///
  /// In en, this message translates to:
  /// **'Add New Address'**
  String get addNewAddress;

  /// No description provided for @editAddress.
  ///
  /// In en, this message translates to:
  /// **'Edit Address'**
  String get editAddress;

  /// No description provided for @deleteAddress.
  ///
  /// In en, this message translates to:
  /// **'Delete Address'**
  String get deleteAddress;

  /// No description provided for @selectAddress.
  ///
  /// In en, this message translates to:
  /// **'Select Address'**
  String get selectAddress;

  /// No description provided for @proceedToPayment.
  ///
  /// In en, this message translates to:
  /// **'Proceed to Payment'**
  String get proceedToPayment;

  /// No description provided for @orderSummary.
  ///
  /// In en, this message translates to:
  /// **'Order Summary'**
  String get orderSummary;

  /// No description provided for @itemsTotal.
  ///
  /// In en, this message translates to:
  /// **'Items Total'**
  String get itemsTotal;

  /// No description provided for @taxesAndFees.
  ///
  /// In en, this message translates to:
  /// **'Taxes and Fees'**
  String get taxesAndFees;

  /// No description provided for @discount.
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get discount;

  /// No description provided for @couponCode.
  ///
  /// In en, this message translates to:
  /// **'Coupon Code'**
  String get couponCode;

  /// No description provided for @applyCoupon.
  ///
  /// In en, this message translates to:
  /// **'Apply Coupon'**
  String get applyCoupon;

  /// No description provided for @removeCoupon.
  ///
  /// In en, this message translates to:
  /// **'Remove Coupon'**
  String get removeCoupon;

  /// No description provided for @validCoupon.
  ///
  /// In en, this message translates to:
  /// **'Valid coupon applied'**
  String get validCoupon;

  /// No description provided for @invalidCoupon.
  ///
  /// In en, this message translates to:
  /// **'Invalid coupon code'**
  String get invalidCoupon;

  /// No description provided for @expiredCoupon.
  ///
  /// In en, this message translates to:
  /// **'Coupon has expired'**
  String get expiredCoupon;

  /// No description provided for @minimumOrderAmount.
  ///
  /// In en, this message translates to:
  /// **'Minimum order amount not met'**
  String get minimumOrderAmount;

  /// No description provided for @orderConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Order Confirmation'**
  String get orderConfirmation;

  /// No description provided for @thankYou.
  ///
  /// In en, this message translates to:
  /// **'Thank You!'**
  String get thankYou;

  /// No description provided for @orderNumber.
  ///
  /// In en, this message translates to:
  /// **'Order Number'**
  String get orderNumber;

  /// No description provided for @estimatedDelivery.
  ///
  /// In en, this message translates to:
  /// **'Estimated Delivery'**
  String get estimatedDelivery;

  /// No description provided for @trackYourOrder.
  ///
  /// In en, this message translates to:
  /// **'Track Your Order'**
  String get trackYourOrder;

  /// No description provided for @continueShopping.
  ///
  /// In en, this message translates to:
  /// **'Continue Shopping'**
  String get continueShopping;

  /// No description provided for @backToHome.
  ///
  /// In en, this message translates to:
  /// **'Back to Home'**
  String get backToHome;

  /// No description provided for @searchProducts.
  ///
  /// In en, this message translates to:
  /// **'Search Products'**
  String get searchProducts;

  /// No description provided for @searchResults.
  ///
  /// In en, this message translates to:
  /// **'Search Results'**
  String get searchResults;

  /// No description provided for @noResultsFound.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get noResultsFound;

  /// No description provided for @tryDifferentKeywords.
  ///
  /// In en, this message translates to:
  /// **'Try different keywords'**
  String get tryDifferentKeywords;

  /// No description provided for @recentSearches.
  ///
  /// In en, this message translates to:
  /// **'Recent Searches'**
  String get recentSearches;

  /// No description provided for @clearSearchHistory.
  ///
  /// In en, this message translates to:
  /// **'Clear Search History'**
  String get clearSearchHistory;

  /// No description provided for @popularSearches.
  ///
  /// In en, this message translates to:
  /// **'Popular Searches'**
  String get popularSearches;

  /// No description provided for @filterBy.
  ///
  /// In en, this message translates to:
  /// **'Filter By'**
  String get filterBy;

  /// No description provided for @sortBy.
  ///
  /// In en, this message translates to:
  /// **'Sort by'**
  String get sortBy;

  /// No description provided for @priceRange.
  ///
  /// In en, this message translates to:
  /// **'Price Range'**
  String get priceRange;

  /// No description provided for @brand.
  ///
  /// In en, this message translates to:
  /// **'Brand'**
  String get brand;

  /// No description provided for @color.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get color;

  /// No description provided for @size.
  ///
  /// In en, this message translates to:
  /// **'Size'**
  String get size;

  /// No description provided for @material.
  ///
  /// In en, this message translates to:
  /// **'Material'**
  String get material;

  /// No description provided for @condition.
  ///
  /// In en, this message translates to:
  /// **'Condition'**
  String get condition;

  /// No description provided for @newCondition.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get newCondition;

  /// No description provided for @usedCondition.
  ///
  /// In en, this message translates to:
  /// **'Used'**
  String get usedCondition;

  /// No description provided for @refurbished.
  ///
  /// In en, this message translates to:
  /// **'Refurbished'**
  String get refurbished;

  /// No description provided for @clearFilters.
  ///
  /// In en, this message translates to:
  /// **'Clear Filters'**
  String get clearFilters;

  /// No description provided for @applyFilters.
  ///
  /// In en, this message translates to:
  /// **'Apply Filters'**
  String get applyFilters;

  /// No description provided for @sortByPrice.
  ///
  /// In en, this message translates to:
  /// **'Sort by Price'**
  String get sortByPrice;

  /// No description provided for @sortByRating.
  ///
  /// In en, this message translates to:
  /// **'Sort by Rating'**
  String get sortByRating;

  /// No description provided for @sortByNewest.
  ///
  /// In en, this message translates to:
  /// **'Sort by Newest'**
  String get sortByNewest;

  /// No description provided for @sortByPopularity.
  ///
  /// In en, this message translates to:
  /// **'Sort by Popularity'**
  String get sortByPopularity;

  /// No description provided for @lowToHigh.
  ///
  /// In en, this message translates to:
  /// **'Low to High'**
  String get lowToHigh;

  /// No description provided for @highToLow.
  ///
  /// In en, this message translates to:
  /// **'High to Low'**
  String get highToLow;

  /// No description provided for @customerReviews.
  ///
  /// In en, this message translates to:
  /// **'Customer Reviews'**
  String get customerReviews;

  /// No description provided for @writeReview.
  ///
  /// In en, this message translates to:
  /// **'Write a Review'**
  String get writeReview;

  /// No description provided for @readAllReviews.
  ///
  /// In en, this message translates to:
  /// **'Read All Reviews'**
  String get readAllReviews;

  /// No description provided for @helpful.
  ///
  /// In en, this message translates to:
  /// **'Helpful'**
  String get helpful;

  /// No description provided for @notHelpful.
  ///
  /// In en, this message translates to:
  /// **'Not Helpful'**
  String get notHelpful;

  /// No description provided for @reportReview.
  ///
  /// In en, this message translates to:
  /// **'Report Review'**
  String get reportReview;

  /// No description provided for @verifiedPurchase.
  ///
  /// In en, this message translates to:
  /// **'Verified Purchase'**
  String get verifiedPurchase;

  /// No description provided for @reviewSubmitted.
  ///
  /// In en, this message translates to:
  /// **'Review submitted successfully'**
  String get reviewSubmitted;

  /// No description provided for @rateProduct.
  ///
  /// In en, this message translates to:
  /// **'Rate this product'**
  String get rateProduct;

  /// No description provided for @writeYourReview.
  ///
  /// In en, this message translates to:
  /// **'Write your review'**
  String get writeYourReview;

  /// No description provided for @submitReview.
  ///
  /// In en, this message translates to:
  /// **'Submit Review'**
  String get submitReview;

  /// No description provided for @reviewGuidelines.
  ///
  /// In en, this message translates to:
  /// **'Review Guidelines'**
  String get reviewGuidelines;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @privacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get privacy;

  /// No description provided for @security.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get security;

  /// No description provided for @helpAndSupport.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get helpAndSupport;

  /// No description provided for @contactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contactUs;

  /// No description provided for @faq.
  ///
  /// In en, this message translates to:
  /// **'FAQ'**
  String get faq;

  /// No description provided for @termsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfService;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteAccount;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePassword;

  /// No description provided for @currentPassword.
  ///
  /// In en, this message translates to:
  /// **'Current Password'**
  String get currentPassword;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @passwordChanged.
  ///
  /// In en, this message translates to:
  /// **'Password changed successfully'**
  String get passwordChanged;

  /// No description provided for @passwordMismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordMismatch;

  /// No description provided for @weakPassword.
  ///
  /// In en, this message translates to:
  /// **'Password is too weak'**
  String get weakPassword;

  /// No description provided for @strongPassword.
  ///
  /// In en, this message translates to:
  /// **'Strong password'**
  String get strongPassword;

  /// No description provided for @emailVerification.
  ///
  /// In en, this message translates to:
  /// **'Email Verification'**
  String get emailVerification;

  /// No description provided for @verifyEmail.
  ///
  /// In en, this message translates to:
  /// **'Verify Email'**
  String get verifyEmail;

  /// No description provided for @resendVerification.
  ///
  /// In en, this message translates to:
  /// **'Resend Verification'**
  String get resendVerification;

  /// No description provided for @emailVerified.
  ///
  /// In en, this message translates to:
  /// **'Email verified successfully'**
  String get emailVerified;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Invalid email address'**
  String get invalidEmail;

  /// No description provided for @emailAlreadyExists.
  ///
  /// In en, this message translates to:
  /// **'Email already exists'**
  String get emailAlreadyExists;

  /// No description provided for @accountCreated.
  ///
  /// In en, this message translates to:
  /// **'Account created successfully'**
  String get accountCreated;

  /// No description provided for @loginSuccessful.
  ///
  /// In en, this message translates to:
  /// **'Login successful'**
  String get loginSuccessful;

  /// No description provided for @loginFailed.
  ///
  /// In en, this message translates to:
  /// **'Login failed'**
  String get loginFailed;

  /// No description provided for @networkError.
  ///
  /// In en, this message translates to:
  /// **'Network error'**
  String get networkError;

  /// No description provided for @serverError.
  ///
  /// In en, this message translates to:
  /// **'Server error'**
  String get serverError;

  /// No description provided for @unknownError.
  ///
  /// In en, this message translates to:
  /// **'Unknown error occurred'**
  String get unknownError;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get tryAgain;

  /// No description provided for @refresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;

  /// No description provided for @noInternetConnection.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get noInternetConnection;

  /// No description provided for @checkConnection.
  ///
  /// In en, this message translates to:
  /// **'Check your connection'**
  String get checkConnection;

  /// No description provided for @offline.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get offline;

  /// No description provided for @online.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get online;

  /// No description provided for @syncData.
  ///
  /// In en, this message translates to:
  /// **'Sync Data'**
  String get syncData;

  /// No description provided for @dataUpdated.
  ///
  /// In en, this message translates to:
  /// **'Data updated'**
  String get dataUpdated;

  /// No description provided for @failedToLoad.
  ///
  /// In en, this message translates to:
  /// **'Failed to load'**
  String get failedToLoad;

  /// No description provided for @itemAdded.
  ///
  /// In en, this message translates to:
  /// **'Item added to cart'**
  String get itemAdded;

  /// No description provided for @itemRemoved.
  ///
  /// In en, this message translates to:
  /// **'Item removed from cart'**
  String get itemRemoved;

  /// No description provided for @cartUpdated.
  ///
  /// In en, this message translates to:
  /// **'Cart updated'**
  String get cartUpdated;

  /// No description provided for @wishlistUpdated.
  ///
  /// In en, this message translates to:
  /// **'Wishlist updated'**
  String get wishlistUpdated;

  /// No description provided for @productUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Product unavailable'**
  String get productUnavailable;

  /// No description provided for @stockLimited.
  ///
  /// In en, this message translates to:
  /// **'Stock limited'**
  String get stockLimited;

  /// No description provided for @maxQuantityReached.
  ///
  /// In en, this message translates to:
  /// **'Maximum quantity reached'**
  String get maxQuantityReached;

  /// No description provided for @minQuantityRequired.
  ///
  /// In en, this message translates to:
  /// **'Minimum quantity required'**
  String get minQuantityRequired;

  /// No description provided for @invalidQuantity.
  ///
  /// In en, this message translates to:
  /// **'Invalid quantity'**
  String get invalidQuantity;

  /// No description provided for @priceUpdated.
  ///
  /// In en, this message translates to:
  /// **'Price updated'**
  String get priceUpdated;

  /// No description provided for @salePrice.
  ///
  /// In en, this message translates to:
  /// **'Sale Price'**
  String get salePrice;

  /// No description provided for @originalPrice.
  ///
  /// In en, this message translates to:
  /// **'Original Price'**
  String get originalPrice;

  /// No description provided for @youSave.
  ///
  /// In en, this message translates to:
  /// **'You Save'**
  String get youSave;

  /// No description provided for @percentOff.
  ///
  /// In en, this message translates to:
  /// **'% Off'**
  String get percentOff;

  /// No description provided for @limitedTimeOffer.
  ///
  /// In en, this message translates to:
  /// **'Limited Time Offer'**
  String get limitedTimeOffer;

  /// No description provided for @flashSale.
  ///
  /// In en, this message translates to:
  /// **'Flash Sale'**
  String get flashSale;

  /// No description provided for @dailyDeal.
  ///
  /// In en, this message translates to:
  /// **'Daily Deal'**
  String get dailyDeal;

  /// No description provided for @weeklyDeal.
  ///
  /// In en, this message translates to:
  /// **'Weekly Deal'**
  String get weeklyDeal;

  /// No description provided for @monthlyDeal.
  ///
  /// In en, this message translates to:
  /// **'Monthly Deal'**
  String get monthlyDeal;

  /// No description provided for @seasonalSale.
  ///
  /// In en, this message translates to:
  /// **'Seasonal Sale'**
  String get seasonalSale;

  /// No description provided for @clearanceSale.
  ///
  /// In en, this message translates to:
  /// **'Clearance Sale'**
  String get clearanceSale;

  /// No description provided for @backInStock.
  ///
  /// In en, this message translates to:
  /// **'Back in Stock'**
  String get backInStock;

  /// No description provided for @comingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming Soon'**
  String get comingSoon;

  /// No description provided for @preOrder.
  ///
  /// In en, this message translates to:
  /// **'Pre-order'**
  String get preOrder;

  /// No description provided for @notify.
  ///
  /// In en, this message translates to:
  /// **'Notify'**
  String get notify;

  /// No description provided for @notifyWhenAvailable.
  ///
  /// In en, this message translates to:
  /// **'Notify when available'**
  String get notifyWhenAvailable;

  /// No description provided for @subscribeToUpdates.
  ///
  /// In en, this message translates to:
  /// **'Subscribe to updates'**
  String get subscribeToUpdates;

  /// No description provided for @unsubscribe.
  ///
  /// In en, this message translates to:
  /// **'Unsubscribe'**
  String get unsubscribe;

  /// No description provided for @subscribed.
  ///
  /// In en, this message translates to:
  /// **'Subscribed'**
  String get subscribed;

  /// No description provided for @newsletter.
  ///
  /// In en, this message translates to:
  /// **'Newsletter'**
  String get newsletter;

  /// No description provided for @promotions.
  ///
  /// In en, this message translates to:
  /// **'Promotions'**
  String get promotions;

  /// No description provided for @specialOffers.
  ///
  /// In en, this message translates to:
  /// **'Special Offers'**
  String get specialOffers;

  /// No description provided for @exclusiveDeals.
  ///
  /// In en, this message translates to:
  /// **'Exclusive Deals'**
  String get exclusiveDeals;

  /// No description provided for @memberOnly.
  ///
  /// In en, this message translates to:
  /// **'Member Only'**
  String get memberOnly;

  /// No description provided for @vipAccess.
  ///
  /// In en, this message translates to:
  /// **'VIP Access'**
  String get vipAccess;

  /// No description provided for @earlyAccess.
  ///
  /// In en, this message translates to:
  /// **'Early Access'**
  String get earlyAccess;

  /// No description provided for @betaFeature.
  ///
  /// In en, this message translates to:
  /// **'Beta Feature'**
  String get betaFeature;

  /// No description provided for @newFeature.
  ///
  /// In en, this message translates to:
  /// **'New Feature'**
  String get newFeature;

  /// No description provided for @featureUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Feature unavailable'**
  String get featureUnavailable;

  /// No description provided for @maintenanceMode.
  ///
  /// In en, this message translates to:
  /// **'Maintenance Mode'**
  String get maintenanceMode;

  /// No description provided for @serviceUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Service unavailable'**
  String get serviceUnavailable;

  /// No description provided for @temporarilyUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Temporarily unavailable'**
  String get temporarilyUnavailable;

  /// No description provided for @backSoon.
  ///
  /// In en, this message translates to:
  /// **'Back soon'**
  String get backSoon;

  /// No description provided for @underMaintenance.
  ///
  /// In en, this message translates to:
  /// **'Under maintenance'**
  String get underMaintenance;

  /// No description provided for @scheduledMaintenance.
  ///
  /// In en, this message translates to:
  /// **'Scheduled maintenance'**
  String get scheduledMaintenance;

  /// No description provided for @emergencyMaintenance.
  ///
  /// In en, this message translates to:
  /// **'Emergency maintenance'**
  String get emergencyMaintenance;

  /// No description provided for @systemUpdate.
  ///
  /// In en, this message translates to:
  /// **'System update'**
  String get systemUpdate;

  /// No description provided for @appUpdate.
  ///
  /// In en, this message translates to:
  /// **'App update'**
  String get appUpdate;

  /// No description provided for @updateAvailable.
  ///
  /// In en, this message translates to:
  /// **'Update available'**
  String get updateAvailable;

  /// No description provided for @updateRequired.
  ///
  /// In en, this message translates to:
  /// **'Update required'**
  String get updateRequired;

  /// No description provided for @updateNow.
  ///
  /// In en, this message translates to:
  /// **'Update Now'**
  String get updateNow;

  /// No description provided for @updateLater.
  ///
  /// In en, this message translates to:
  /// **'Update Later'**
  String get updateLater;

  /// No description provided for @skipUpdate.
  ///
  /// In en, this message translates to:
  /// **'Skip Update'**
  String get skipUpdate;

  /// No description provided for @downloading.
  ///
  /// In en, this message translates to:
  /// **'Downloading'**
  String get downloading;

  /// No description provided for @installing.
  ///
  /// In en, this message translates to:
  /// **'Installing'**
  String get installing;

  /// No description provided for @updateComplete.
  ///
  /// In en, this message translates to:
  /// **'Update complete'**
  String get updateComplete;

  /// No description provided for @updateFailed.
  ///
  /// In en, this message translates to:
  /// **'Update failed'**
  String get updateFailed;

  /// No description provided for @restartRequired.
  ///
  /// In en, this message translates to:
  /// **'Restart required'**
  String get restartRequired;

  /// No description provided for @restartNow.
  ///
  /// In en, this message translates to:
  /// **'Restart Now'**
  String get restartNow;

  /// No description provided for @restartLater.
  ///
  /// In en, this message translates to:
  /// **'Restart Later'**
  String get restartLater;

  /// No description provided for @newestProducts.
  ///
  /// In en, this message translates to:
  /// **'Newest Products'**
  String get newestProducts;

  /// No description provided for @oopsNotFound.
  ///
  /// In en, this message translates to:
  /// **'Oops Not Found !'**
  String get oopsNotFound;

  /// No description provided for @noResultsFoundMessage.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get noResultsFoundMessage;

  /// No description provided for @searchLabel.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get searchLabel;

  /// No description provided for @cartTitle.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cartTitle;

  /// No description provided for @checkoutButton.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkoutButton;

  /// No description provided for @removeFromCart.
  ///
  /// In en, this message translates to:
  /// **'Remove from cart'**
  String get removeFromCart;

  /// No description provided for @clearCart.
  ///
  /// In en, this message translates to:
  /// **'Clear cart'**
  String get clearCart;

  /// No description provided for @cartIsEmpty.
  ///
  /// In en, this message translates to:
  /// **'Cart is empty'**
  String get cartIsEmpty;

  /// No description provided for @addToCartSuccess.
  ///
  /// In en, this message translates to:
  /// **'Added to cart successfully'**
  String get addToCartSuccess;

  /// No description provided for @removedFromCartSuccess.
  ///
  /// In en, this message translates to:
  /// **'Removed from cart successfully'**
  String get removedFromCartSuccess;

  /// No description provided for @quantityUpdated.
  ///
  /// In en, this message translates to:
  /// **'Quantity updated'**
  String get quantityUpdated;

  /// No description provided for @proceedToCheckout.
  ///
  /// In en, this message translates to:
  /// **'Proceed to checkout'**
  String get proceedToCheckout;

  /// No description provided for @backToShopping.
  ///
  /// In en, this message translates to:
  /// **'Back to shopping'**
  String get backToShopping;

  /// No description provided for @itemsInCart.
  ///
  /// In en, this message translates to:
  /// **'items in cart'**
  String get itemsInCart;

  /// No description provided for @totalAmount.
  ///
  /// In en, this message translates to:
  /// **'Total amount'**
  String get totalAmount;

  /// No description provided for @shippingFee.
  ///
  /// In en, this message translates to:
  /// **'Shipping fee'**
  String get shippingFee;

  /// No description provided for @taxAmount.
  ///
  /// In en, this message translates to:
  /// **'Tax amount'**
  String get taxAmount;

  /// No description provided for @grandTotal.
  ///
  /// In en, this message translates to:
  /// **'Grand total'**
  String get grandTotal;

  /// No description provided for @selectPaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Select Payment Method'**
  String get selectPaymentMethod;

  /// No description provided for @orderSummaryTitle.
  ///
  /// In en, this message translates to:
  /// **'Order Summary'**
  String get orderSummaryTitle;

  /// No description provided for @billingInformation.
  ///
  /// In en, this message translates to:
  /// **'Billing Information'**
  String get billingInformation;

  /// No description provided for @shippingInformation.
  ///
  /// In en, this message translates to:
  /// **'Shipping Information'**
  String get shippingInformation;

  /// No description provided for @paymentInformation.
  ///
  /// In en, this message translates to:
  /// **'Payment Information'**
  String get paymentInformation;

  /// No description provided for @reviewOrder.
  ///
  /// In en, this message translates to:
  /// **'Review Order'**
  String get reviewOrder;

  /// No description provided for @confirmOrder.
  ///
  /// In en, this message translates to:
  /// **'Confirm Order'**
  String get confirmOrder;

  /// No description provided for @orderConfirmed.
  ///
  /// In en, this message translates to:
  /// **'Order Confirmed'**
  String get orderConfirmed;

  /// No description provided for @thankYouForOrder.
  ///
  /// In en, this message translates to:
  /// **'Thank you for your order!'**
  String get thankYouForOrder;

  /// No description provided for @orderWillBeProcessed.
  ///
  /// In en, this message translates to:
  /// **'Your order will be processed soon'**
  String get orderWillBeProcessed;

  /// No description provided for @trackOrderStatus.
  ///
  /// In en, this message translates to:
  /// **'Track order status'**
  String get trackOrderStatus;

  /// No description provided for @viewOrderDetails.
  ///
  /// In en, this message translates to:
  /// **'View order details'**
  String get viewOrderDetails;

  /// No description provided for @downloadReceipt.
  ///
  /// In en, this message translates to:
  /// **'Download receipt'**
  String get downloadReceipt;

  /// No description provided for @shareOrder.
  ///
  /// In en, this message translates to:
  /// **'Share order'**
  String get shareOrder;

  /// No description provided for @rateExperience.
  ///
  /// In en, this message translates to:
  /// **'Rate your experience'**
  String get rateExperience;

  /// No description provided for @contactSupport.
  ///
  /// In en, this message translates to:
  /// **'Contact support'**
  String get contactSupport;

  /// No description provided for @returnToHome.
  ///
  /// In en, this message translates to:
  /// **'Return to home'**
  String get returnToHome;

  /// No description provided for @continueShoppingButton.
  ///
  /// In en, this message translates to:
  /// **'Continue Shopping'**
  String get continueShoppingButton;

  /// No description provided for @viewCart.
  ///
  /// In en, this message translates to:
  /// **'View Cart'**
  String get viewCart;

  /// No description provided for @updateCart.
  ///
  /// In en, this message translates to:
  /// **'Update Cart'**
  String get updateCart;

  /// No description provided for @emptyCartMessage.
  ///
  /// In en, this message translates to:
  /// **'Your cart is empty. Start shopping to add items!'**
  String get emptyCartMessage;

  /// No description provided for @startShopping.
  ///
  /// In en, this message translates to:
  /// **'Start Shopping'**
  String get startShopping;

  /// No description provided for @recommendedProducts.
  ///
  /// In en, this message translates to:
  /// **'Recommended Products'**
  String get recommendedProducts;

  /// No description provided for @recentlyViewed.
  ///
  /// In en, this message translates to:
  /// **'Recently Viewed'**
  String get recentlyViewed;

  /// No description provided for @similarProducts.
  ///
  /// In en, this message translates to:
  /// **'Similar Products'**
  String get similarProducts;

  /// No description provided for @frequentlyBoughtTogether.
  ///
  /// In en, this message translates to:
  /// **'Frequently Bought Together'**
  String get frequentlyBoughtTogether;

  /// No description provided for @customerAlsoBought.
  ///
  /// In en, this message translates to:
  /// **'Customers also bought'**
  String get customerAlsoBought;

  /// No description provided for @relatedProducts.
  ///
  /// In en, this message translates to:
  /// **'Related Products'**
  String get relatedProducts;

  /// No description provided for @moreFromCategory.
  ///
  /// In en, this message translates to:
  /// **'More from this category'**
  String get moreFromCategory;

  /// No description provided for @topRated.
  ///
  /// In en, this message translates to:
  /// **'Top Rated'**
  String get topRated;

  /// No description provided for @onSale.
  ///
  /// In en, this message translates to:
  /// **'On Sale'**
  String get onSale;

  /// No description provided for @featured.
  ///
  /// In en, this message translates to:
  /// **'Featured'**
  String get featured;

  /// No description provided for @trending.
  ///
  /// In en, this message translates to:
  /// **'Trending'**
  String get trending;

  /// No description provided for @justForYou.
  ///
  /// In en, this message translates to:
  /// **'Just for You'**
  String get justForYou;

  /// No description provided for @basedOnHistory.
  ///
  /// In en, this message translates to:
  /// **'Based on your history'**
  String get basedOnHistory;

  /// No description provided for @personalizedRecommendations.
  ///
  /// In en, this message translates to:
  /// **'Personalized Recommendations'**
  String get personalizedRecommendations;

  /// No description provided for @highestToLowest.
  ///
  /// In en, this message translates to:
  /// **'Highest to Lowest'**
  String get highestToLowest;

  /// No description provided for @lowestToHighest.
  ///
  /// In en, this message translates to:
  /// **'Lowest to Highest'**
  String get lowestToHighest;

  /// No description provided for @sortedBy.
  ///
  /// In en, this message translates to:
  /// **'Sorted By'**
  String get sortedBy;

  /// No description provided for @lowestPrice.
  ///
  /// In en, this message translates to:
  /// **'Lowest Price'**
  String get lowestPrice;

  /// No description provided for @highestPrice.
  ///
  /// In en, this message translates to:
  /// **'Highest Price'**
  String get highestPrice;

  /// No description provided for @createNewAccount.
  ///
  /// In en, this message translates to:
  /// **'Create a new account'**
  String get createNewAccount;

  /// No description provided for @fullNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Full Name is required'**
  String get fullNameRequired;

  /// No description provided for @fullNameMinLength.
  ///
  /// In en, this message translates to:
  /// **'Full Name must be at least 3 characters'**
  String get fullNameMinLength;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @phoneRequired.
  ///
  /// In en, this message translates to:
  /// **'Phone is required'**
  String get phoneRequired;

  /// No description provided for @phoneMinLength.
  ///
  /// In en, this message translates to:
  /// **'Phone must be at least 10 characters'**
  String get phoneMinLength;

  /// No description provided for @emailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get emailRequired;

  /// No description provided for @invalidEmailFormat.
  ///
  /// In en, this message translates to:
  /// **'Invalid email format'**
  String get invalidEmailFormat;

  /// No description provided for @passwordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get passwordRequired;

  /// No description provided for @passwordMinLength.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get passwordMinLength;

  /// No description provided for @signUpSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Sign up successfully'**
  String get signUpSuccessfully;

  /// No description provided for @pleaseLoginToAccount.
  ///
  /// In en, this message translates to:
  /// **'please login to your account'**
  String get pleaseLoginToAccount;

  /// No description provided for @loggedInSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Logged In Successfully'**
  String get loggedInSuccessfully;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @orLoginWith.
  ///
  /// In en, this message translates to:
  /// **'or login with'**
  String get orLoginWith;

  /// No description provided for @dontHaveAccountSignUp.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? Sign up'**
  String get dontHaveAccountSignUp;

  /// No description provided for @alreadyHaveAccountLogin.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? Login'**
  String get alreadyHaveAccountLogin;

  /// No description provided for @addedToCart.
  ///
  /// In en, this message translates to:
  /// **'Added To Cart'**
  String get addedToCart;

  /// No description provided for @visa.
  ///
  /// In en, this message translates to:
  /// **'Visa'**
  String get visa;

  /// No description provided for @street.
  ///
  /// In en, this message translates to:
  /// **'Street'**
  String get street;

  /// No description provided for @building.
  ///
  /// In en, this message translates to:
  /// **'Building'**
  String get building;

  /// No description provided for @floor.
  ///
  /// In en, this message translates to:
  /// **'Floor'**
  String get floor;

  /// No description provided for @apartment.
  ///
  /// In en, this message translates to:
  /// **'Apartment'**
  String get apartment;

  /// No description provided for @addressRequired.
  ///
  /// In en, this message translates to:
  /// **'Address is required'**
  String get addressRequired;

  /// No description provided for @streetRequired.
  ///
  /// In en, this message translates to:
  /// **'Street is required'**
  String get streetRequired;

  /// No description provided for @buildingRequired.
  ///
  /// In en, this message translates to:
  /// **'Building is required'**
  String get buildingRequired;

  /// No description provided for @cityRequired.
  ///
  /// In en, this message translates to:
  /// **'City is required'**
  String get cityRequired;

  /// No description provided for @countryRequired.
  ///
  /// In en, this message translates to:
  /// **'Country is required'**
  String get countryRequired;

  /// No description provided for @newLabel.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get newLabel;

  /// No description provided for @orderCompleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Order Completed Successfully!'**
  String get orderCompleteTitle;

  /// No description provided for @orderCompleteMessage.
  ///
  /// In en, this message translates to:
  /// **'Thank you for your purchase. Your order has been placed successfully.'**
  String get orderCompleteMessage;

  /// No description provided for @noProductsInCategory.
  ///
  /// In en, this message translates to:
  /// **'No products in this category'**
  String get noProductsInCategory;

  /// No description provided for @emptyCartTitle.
  ///
  /// In en, this message translates to:
  /// **'Your cart is empty'**
  String get emptyCartTitle;

  /// No description provided for @emptyCartSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Add some products to get started'**
  String get emptyCartSubtitle;

  /// No description provided for @shopNow.
  ///
  /// In en, this message translates to:
  /// **'Shop Now'**
  String get shopNow;

  /// No description provided for @products.
  ///
  /// In en, this message translates to:
  /// **'products'**
  String get products;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
