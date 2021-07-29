
String removerBarrasDuplicadas(String url) {
  url = url.replaceAll("//", "/");
  url = url.replaceFirst("http:/", "http://");
  url = url.replaceFirst("https:/", "https://");

  return url;
}