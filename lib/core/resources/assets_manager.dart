const String imagePath = "assets/images";
const String jsonPath = "assets/json";
const String iconsPath = "assets/icons";
const String svgPath = "assets/svg_images";

abstract class ImageAssets {
  static const String splashLogo = "$imagePath/splash.png";
  static const String categoryCardImage = "$imagePath/category_card_image.png";

  static const String subcategoryCardImage =
      "$imagePath/sub_category_card_image.png";
  static const String carouselSlider1 = "$imagePath/CarouselSlider1.png";

  static const String categoryHomeImage = "$imagePath/category_image.jpg";
  static const String carouselSlider2 = "$imagePath/CarouselSlider2.png";
  static const String carouselSlider3 = "$imagePath/CarouselSlider3.png";
  static const String brandHomeImage = "$imagePath/brands_section_image.png";
  static const String productImage = "$imagePath/product_image.png";

  static const String rate = "$imagePath/rate.png";

  static const String shoppingCart = "$imagePath/shopping_cart.png";
  static const String favoriteIcon = "$imagePath/favorite.png";
  static const String notFavoriteIcon = "$imagePath/not_favorite.png";
  static const String searchIcon = "$imagePath/search_tab.png";
}

class SvgAssets {
  static const String onBoardingSearch = "$svgPath/ic_search.svg";
  static const String onBoardingCircleMsg = "$svgPath/ic_circleMsg.svg";
  static const String onBoardingStar = "$svgPath/ic_star.svg";
  static const String userIcon = "$svgPath/ic_user.svg";
  static const String bagIcon = "$svgPath/ic_bag.svg";
  static const String wrenchIcon = "$svgPath/ic_wrench.svg";
  static const String eye = "$svgPath/Eye.svg";
  static const String google = "$svgPath/google_icon.svg";
  static const String mobile = "$svgPath/mobile_icon.svg";
  static const String zaphWhite = "$svgPath/ic_zap_2.svg";
}

abstract class IconsAssets {
  static const String _icCategory = "$iconsPath/ic_category.png";
  static const String _icMap = "$iconsPath/ic_map.svg";
  static const String _icMessages = "$iconsPath/ic_message.svg";
  static const String _icHome = "$iconsPath/ic_home.svg";
  static const String _icProfile = "$iconsPath/ic_profile.svg";
  static const String _icWithList = "$iconsPath/ic_wish_list.png";
  static const String _icCart = "$iconsPath/ic_cart.png";
  static const String _icSearch = "$iconsPath/ic_search.svg";
  static const String icDelete = "$iconsPath/ic_delete.png";
  static const String _icHeart = "$iconsPath/heart.png";
  static const String _icClickedHeart = "$iconsPath/clicked_heart.png";

  static String get icCategory => _icCategory;
  static String get icMap => _icMap;
  static String get icMessages => _icMessages;
  static String get icHome => _icHome;
  static String get icProfile => _icProfile;
  static String get icWithList => _icWithList;
  static String get icCart => _icCart;
  static String get icSearch => _icSearch;
  static String get icHeart => _icHeart;
  static String get icClickedHeart => _icClickedHeart;
}

class JsonAssets {
  static const String loading = "$jsonPath/loading.json";
  static const String error = "$jsonPath/error.json";
  static const String empty = "$jsonPath/empty.json";
  static const String success = "$jsonPath/success.json";
}
