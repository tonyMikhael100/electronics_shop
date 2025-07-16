/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsAnimationGen {
  const $AssetsAnimationGen();

  /// File path: assets/animation/empty_cart.json
  String get emptyCart => 'assets/animation/empty_cart.json';

  /// File path: assets/animation/error_animation.json
  String get errorAnimation => 'assets/animation/error_animation.json';

  /// List of all assets
  List<String> get values => [emptyCart, errorAnimation];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Bookmark.svg
  String get bookmark => 'assets/images/Bookmark.svg';

  /// File path: assets/images/Home.svg
  String get home => 'assets/images/Home.svg';

  /// File path: assets/images/accessories.png
  AssetGenImage get accessories =>
      const AssetGenImage('assets/images/accessories.png');

  /// File path: assets/images/align-left.svg
  String get alignLeft => 'assets/images/align-left.svg';

  /// File path: assets/images/auth_image.png
  AssetGenImage get authImage =>
      const AssetGenImage('assets/images/auth_image.png');

  /// File path: assets/images/box.svg
  String get box => 'assets/images/box.svg';

  /// File path: assets/images/cart.svg
  String get cart => 'assets/images/cart.svg';

  /// File path: assets/images/category.svg
  String get category => 'assets/images/category.svg';

  /// File path: assets/images/cod.svg
  String get cod => 'assets/images/cod.svg';

  /// File path: assets/images/empty-box.svg
  String get emptyBoxSvg => 'assets/images/empty-box.svg';

  /// File path: assets/images/empty_box.svg
  String get emptyBoxSvg_ => 'assets/images/empty_box.svg';

  /// File path: assets/images/favourite-svgrepo-com.svg
  String get favouriteSvgrepoCom => 'assets/images/favourite-svgrepo-com.svg';

  /// File path: assets/images/headphone.png
  AssetGenImage get headphone =>
      const AssetGenImage('assets/images/headphone.png');

  /// File path: assets/images/home2-svgrepo-com.svg
  String get home2SvgrepoCom => 'assets/images/home2-svgrepo-com.svg';

  /// File path: assets/images/ipad.png
  AssetGenImage get ipad => const AssetGenImage('assets/images/ipad.png');

  /// File path: assets/images/iphone.png
  AssetGenImage get iphone => const AssetGenImage('assets/images/iphone.png');

  /// File path: assets/images/iphone2.png
  AssetGenImage get iphone2 => const AssetGenImage('assets/images/iphone2.png');

  /// File path: assets/images/more.png
  AssetGenImage get more => const AssetGenImage('assets/images/more.png');

  /// File path: assets/images/profile-1335-svgrepo-com.svg
  String get profile1335SvgrepoCom =>
      'assets/images/profile-1335-svgrepo-com.svg';

  /// File path: assets/images/profile.svg
  String get profile => 'assets/images/profile.svg';

  /// File path: assets/images/search-svgrepo-com.svg
  String get searchSvgrepoCom => 'assets/images/search-svgrepo-com.svg';

  /// File path: assets/images/search.svg
  String get search => 'assets/images/search.svg';

  /// File path: assets/images/search2.png
  AssetGenImage get search2 => const AssetGenImage('assets/images/search2.png');

  /// File path: assets/images/visa.svg
  String get visa => 'assets/images/visa.svg';

  /// List of all assets
  List<dynamic> get values => [
    bookmark,
    home,
    accessories,
    alignLeft,
    authImage,
    box,
    cart,
    category,
    cod,
    emptyBoxSvg,
    emptyBoxSvg_,
    favouriteSvgrepoCom,
    headphone,
    home2SvgrepoCom,
    ipad,
    iphone,
    iphone2,
    more,
    profile1335SvgrepoCom,
    profile,
    searchSvgrepoCom,
    search,
    search2,
    visa,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsAnimationGen animation = $AssetsAnimationGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
