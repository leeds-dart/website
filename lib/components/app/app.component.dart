// Copyright (c) 2016, Jimmy Forrester-Fellowes. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:angular2/platform/common.dart' show LocationStrategy, HashLocationStrategy;


import 'package:leeds_dart/components/events/events.component.dart';
import 'package:leeds_dart/components/news/news.component.dart';
import 'package:leeds_dart/components/about/about.component.dart';

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
          name: 'Events',
          component: EventsComponent,
          useAsDefault: true
      ),

      const Route(
          path: '/news',
          name: 'News',
          component: NewsComponent
      ),

      const Route(
          path: '/about',
          name: 'About',
          component: AboutComponent
      ),

    ]
)

class AppComponent {}
