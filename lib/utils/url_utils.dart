class UrlUtils {
  static String parseUrl(String url, List<String> params) {
    for (String param in params) {
      url = url.replaceFirst('*', param);
    }
    return url;
  }
}
