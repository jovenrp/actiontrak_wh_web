
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CustomApi {
  //static String mainUrl = 'http://actiontrak.net:80';
  //static String mainUrl = 'http://216.83.134.87:5000';
  static String mainUrl = dotenv.env['API_URL'].toString();

  static String login({String? uid, String? pwd}) =>
      "$mainUrl/userBasicLogin.html?uid=$uid&pwd=$pwd";

  static String getPickTickets({String? token, String? data}) =>
      "$mainUrl/mobile(getPickTickets)?useHdrs=true&sessId=$token&data=$data";

  static String getReceiveTickets({String? token}) =>
      "$mainUrl/mobile(getReceiveTickets)?useHdrs=true&sessId=$token";
  static String getReceiveTicketDetails({String? token, String? data}) =>
      "$mainUrl/mobile(getReceiveTicket)?useHdrs=true&sessId=$token&data=$data";
  static String submitReceiveDetail({String? token, String? data}) =>
      "$mainUrl/mobile(submitReceiveDetail)?useHdrs=true&sessId=$token&data=$data";
  static String completeReceiveTicket({String? token, String? data}) =>
      "$mainUrl/mobile(completeReceiveTicket)?useHdrs=true&sessId=$token&data=$data";

  static String getShipTickets({String? token}) =>
      "$mainUrl/mobile(getShipTickets)?useHdrs=true&sessId=$token";

  static String getStockCount({String? token}) =>
      "$mainUrl/mobile(getCountTickets)?useHdrs=true&sessId=$token";

  static String lookupItemAlias({String? token, String? alias}) =>
      "$mainUrl/mobile(lookupItemAlias)?useHdrs=true&sessId=$token&alias=$alias";
  static String getItemStockList({String? token, String? itemId}) =>
      "$mainUrl/mobile(getItemStockList)?useHdrs=true&sessId=$token&itemId=$itemId";
  static String getItemTrakList({String? token, String? itemId}) =>
      "$mainUrl/mobile(getItemTrakList)?useHdrs=true&sessId=$token&itemId=$itemId";

  static String getStockAdjust({String? token, String? data}) =>
      "$mainUrl/mobile(stockAdjustBySku)?useHdrs=true&sessId=$token&data=$data";
  static String stockLookup({String? token, String? data}) =>
      "$mainUrl/mobile(stockLookUp)?useHdrs=true&sessId={token}&data={data}";

  static String getContainer({String? token, String? data}) =>
      "$mainUrl/mobile(getContainer)?useHdrs=true&sessId=$token&data=$data";
  static String getContainerChildren({String? token, String? data}) =>
      "$mainUrl/mobile(getContainerChildren)?useHdrs=true&sessId=$token&data=$data";
  static String createContainer({String? token, String? data}) =>
      "$mainUrl/mobile(createContainer)?useHdrs=true&sessId=$token&data=$data";
  static String getContainerSkus({String? token, String? data}) =>
      "$mainUrl/mobile(getContainerSkus)?useHdrs=true&sessId=$token&data=$data";
  static String removeContainerSku({String? token, String? data}) =>
      "$mainUrl/mobile(removeContainerSku)?useHdrs=true&sessId=$token&data=$data";
  static String addContainerSku({String? token, String? data}) =>
      "$mainUrl/mobile(addContainerSku)?useHdrs=true&sessId=$token&data=$data";
  static String updateContainer({String? token, String? data}) =>
      "$mainUrl/mobile(updateContainer)?useHdrs=true&sessId=$token&data=$data";

  static String stockYield({String? token, String? data}) =>
      "$mainUrl/mobile(stockYield)?useHdrs=true&sessId=$token&data=$data";



}
