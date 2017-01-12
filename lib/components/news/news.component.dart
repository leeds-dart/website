// Copyright (c) 2016, Jimmy Forrester-Fellowes. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:convert' show UTF8, JSON, AsciiCodec;


import 'package:angular2/core.dart';
import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:angular2_components/angular2_components.dart';
import 'package:angular2/platform/common.dart' show LocationStrategy, HashLocationStrategy;



@Component(
    selector: 'router-outlet',
    styleUrls: const ['news.component.css'],
    templateUrl: 'news.component.html',
    directives: const [ROUTER_DIRECTIVES, materialDirectives],
    providers: const [
        materialProviders,
        ROUTER_PROVIDERS,
        const Provider(LocationStrategy, useClass: HashLocationStrategy),
      ]
  )

class NewsComponent implements OnInit {


  ngOnInit () {
    print ("init...");
  }


}
