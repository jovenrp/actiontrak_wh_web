
class CustomApi {
  static String mainUrl = 'http://216.83.134.87:5000';

  static String login({String? uid, String? pwd}) =>
      "$mainUrl/userBasicLogin.html?uid=$uid&pwd=$pwd";

  static String getPickTickets({String? token, String? data}) =>
      "$mainUrl/mobile(getPickTickets)?useHdrs=true&sessId=$token&data=$data";

  static String getReceiveTickets({String? token}) =>
      "$mainUrl/mobile(getReceiveTickets)?useHdrs=true&sessId=$token";
  static String getReceiveTicketDetails({String? token, String? data}) =>
      "$mainUrl/mobile(getReceiveTicket)?useHdrs=true&sessId=$token&data=$data";

  static String getShipTickets({String? token}) =>
      "$mainUrl/mobile(getShipTickets)?useHdrs=true&sessId=$token";
}
