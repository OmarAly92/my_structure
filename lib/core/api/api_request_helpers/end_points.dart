sealed class EndPoints {
  static const String baseUrl = 'https://coaching.thebrandmakerz.com/api/';
  static const String refreshToken = '';

  /// AUTH
  static const String login = '/login';
  static const String forgotPassword = 'forgot-password';
  static const String sendOtp = '/$forgotPassword/send-otp';
  static const String verifyOtp = '/$forgotPassword/verify-otp';
  static const String resetPassword = '/$forgotPassword/reset';

  /// HOME
  static const String passengers = 'v1/passengers';
  static const String stations = '$passengers/stations';
  static const String cities = '$passengers/cities';
  static const String areas = '$passengers/areas';
  static const String trip = '$passengers/trips';

  /// RESERVATION
  static String availableSeats(int tripId) {
    return '$passengers/trips/$tripId/available-seats';
  }

  static const String reserveTrip = '$passengers/trips/reserve';
  static const String payment = '$passengers/trips/reserve';
  static const String repayment = '$passengers/trips/reservations/make-payment';

  /// ACCOUNT
  static const String profile = '$passengers/profile';
  static const String deleteAccount = '$profile/disable-account';

  /// AVAILABLE TRIPS
  static const String availableTrips = '$passengers/reservations';
}
