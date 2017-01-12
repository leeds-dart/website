library leeds_dart.services.eventbrite;

import 'dart:async';
import 'dart:convert' show UTF8, JSON, AsciiCodec;
import 'dart:html';
import 'dart:async';

import 'package:crypto/crypto.dart';

import 'package:angular2/core.dart';

import 'package:http/browser_client.dart';
import 'package:http/http.dart';

import 'package:leeds_dart/services/eventbrite/models/event.model.dart';

@Injectable()
class EventbriteService {

  // oAuth
  final String oauthAuthorizeUrl = 'https://www.eventbrite.com/oauth/authorize';
  final String oauthAccessUrl = 'https://www.eventbrite.com/oauth/token';
  final String oauthToken = '4UATZJZ6HMOOZUOVHEN2';

  //Eventbrite
  final String apiEndpoint = 'https://www.eventbriteapi.com/v3';
  final Int organizerId = 12690248238;

  // local
  List<EventbriteEvent> events = {};


  final BrowserClient _http;
  EventbriteService(BrowserClient this._http);

  Future fetchEvents () async {

    // this caching trick doesn't work - seems service is not persistent
    if (events.length > 0) return;

    print ('getting events...');

    // create the query string
    Map<String, String> requestParams = {
      'token': oauthToken,
      'order_by': 'start_asc'
    };
    var requestParamsString = '';
    requestParams.forEach((k,v) {
      requestParamsString +=
        requestParamsString.length?'&':''+k+'='+v;
    });

    String requestUrl = apiEndpoint+'/organizers/'+
      organizerId.toString()+'/events/?'+requestParamsString;

    Response response = await _http.get(
      requestUrl,
      headers: {
        "Authorization"       : "Bearer "+oauthToken
      }
    );

    if (response.statusCode == 200) {
      Map responseDecoded = JSON.decode(response.body);
      events =[];
      responseDecoded['events'].forEach((e) {
        events.add(new EventbriteEvent(e));
      });
      print ("Done fetching events");
    } else {
      print ('Error returning events #'+response.statusCode.toString());
      print (response.body);
    }
  }




}
