// Copyright (c) 2016, Jimmy Forrester-Fellowes. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/core.dart';
import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:angular2_components/angular2_components.dart';

import 'dart:html';

import 'package:leeds_dart/services/eventbrite/eventbrite.service.dart';

@Component(
    selector: 'router-outlet',
    styleUrls: const ['events.component.css'],
    templateUrl: 'events.component.html',
    directives: const [ROUTER_DIRECTIVES, materialDirectives],
    providers: const [materialProviders, EventbriteService]
  )

class EventsComponent implements OnInit {

  final EventbriteService eventbrite;
  List events;

  EventsComponent(EventbriteService this.eventbrite);

  ngOnInit() async {

    // fetch the events from eventbrite
    await eventbrite.fetchEvents().whenComplete(() {
      print ("Fetched events");
      events = eventbrite.events;
    });

  }

  void eventTrigger (e) {
    print (e);
    window.location.assign(e.url);
  }

}
