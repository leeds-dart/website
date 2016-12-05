// Copyright (c) 2016, Jimmy Forrester-Fellowes. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:angular2/platform/common.dart' show LocationStrategy, HashLocationStrategy;

import 'dart:html';

import 'package:leeds_dart/components/about/about.component.dart';
import 'package:leeds_dart/components/events/events.component.dart';
import 'package:leeds_dart/components/news/news.component.dart';

@Component(
    selector: 'my-app',
    templateUrl: 'app.component.html',
    styleUrls: const ['app.component.css'],
    directives: const [ROUTER_DIRECTIVES],
    providers: const [
      // BrowserClient,
      ROUTER_PROVIDERS,
      const Provider(LocationStrategy, useClass: HashLocationStrategy)
    ]
)

@RouteConfig(

    const [

      const Route(
          path: '/',
          name: 'About',
          component: AboutComponent,
          useAsDefault: true
      ),

      const Route(
          path: '/events',
          name: 'Events',
          component: EventsComponent
      ),

      const Route(
          path: '/news',
          name: 'News',
          component: NewsComponent
      ),


    ]
)

class AppComponent implements OnInit {

    Element app;
    Element nav;
    int headerMaxHeight;

  ngOnInit () {
    print ("on init");

    nav = document.querySelector('nav');
    app = document.querySelector('#app');

    window.onResize.listen(uiResize);
    document.querySelector('header img.logo-square').onLoad.listen((e) {
      headerMaxHeight = document.querySelector('header').borderEdge.height;
      uiResize();
    });
    window.onScroll.listen(uiScroll);
    uiResize();
  }

  void uiResize ([Event e]) {

      print ("on resize");
      app.style.minHeight = window.innerHeight.toString()+'px';

      uiScroll();
  }
  void uiScroll ([Event e]) {

      if (headerMaxHeight != null && window.scrollY > (headerMaxHeight -
        (nav.borderEdge.height*2)))
        app.classes.add('fixed');
      else
        app.classes.remove('fixed');


      print ("on scroll "+window.scrollY.toString());
  }

}
