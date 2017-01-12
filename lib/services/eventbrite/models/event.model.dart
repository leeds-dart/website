library leeds_dart.services.eventbrite.event;
import 'package:intl/intl.dart';

class EventbriteEvent {
  Map data;
  EventbriteEvent (Map this.data);

  get id => data['id'];
  get name => data['name']['text'];
  get url => data['url'];
  get descriptionSummary {
    if (data['description']['text'].toString().length > 200)
      return data['description']['text'].toString().substring(0,200)+'...';
    return data['description']['text'].toString();
  }
  get descriptionHtml => data['description']['html'];
  get dateTime {
    DateTime when = DateTime.parse(data['start']['local']);
    var formatter = new DateFormat('yyyy-MM-dd HH:mm');

    return formatter.format(when);
  }
}
