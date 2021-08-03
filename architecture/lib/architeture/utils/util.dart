String removerBarrasDuplicadas(String url) {
  url = url.replaceAll("//", "/");
  url = url.replaceFirst("http:/", "http://");
  url = url.replaceFirst("https:/", "https://");

  return url;
}

bool isNotNullAndNotEmpity(String value) => value != null && value.isNotEmpty;

bool isNullAndEmpity(String value) => value == null && value.isEmpty;

bool isNotNull(Object value) => !isNull(value);

bool isNull(Object value) => value == null;
