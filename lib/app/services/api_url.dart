
class ApiUrl {
  static const String baseUrl = 'http://3.7.200.26:3000';
  final String openTrade =  '$baseUrl/order/open';
  final String completedTrade = '$baseUrl/order/completed';
  final String profit = '$baseUrl/order/profit';
  final String tickers = '$baseUrl/tickers';
  final String tickersUpdate = '$baseUrl/tickers/update';
  
}