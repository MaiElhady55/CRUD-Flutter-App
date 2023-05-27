class ApiConstance {
  static const String baseUrl = 'https://gorest.co.in/public/v2/';
  static const String accessToken =
      '708d496aa7821c8bcacfb9998d748660f7865861fe0e70ab5d41575a834b2db5';

  static const String endPointUser = 'users';

  static String editPath(int id) => '$endPointUser/$id';
}
