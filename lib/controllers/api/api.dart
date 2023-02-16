class Api {
  static String mobileApp = "http://10.0.2.2:8000/";
  static String windowsApp = "http://127.0.0.1:8000/";
  static String baseUrl = mobileApp;
  static String newsEndPoint = "api/mobile/news/";
  static String categoriesEndPoint = "api/mobile/categories/";
  static String commentsEndPoint = "api/mobile/news/comments/";
  static String sliderEndPoint = "api/slider/";

  static String get getNewsUrl {
    String url = "";
    url = Api.mobileApp + Api.newsEndPoint;
    return url;
  }

  static String commentsQueryUrl({required int newId}) {
    String url;
    url = "${Api.mobileApp + Api.commentsEndPoint}?id=$newId";
    return url;
  }

  static String newsQueryUrl({int? categoryId, bool? hasVideo}) {
    String url = "";
    if (categoryId != null && hasVideo != null) {
      url =
          "${Api.baseUrl + Api.newsEndPoint}?hasVideo=$hasVideo&categoryId=$categoryId";
    } else if (categoryId != null) {
      url = "${Api.baseUrl + Api.newsEndPoint}?categoryId=$categoryId";
    } else if (hasVideo != null) {
      url = "${Api.baseUrl + Api.newsEndPoint}?hasVideo=$hasVideo";
    } else {
      url = Api.baseUrl + Api.newsEndPoint;
    }
    return url;
  }

  static String get getSlidersUrl {
    String url = Api.mobileApp + Api.sliderEndPoint;
    return url;
  }

  static String get getCategoriesUrl {
    String url = Api.mobileApp + Api.categoriesEndPoint;
    return url;
  }
}
