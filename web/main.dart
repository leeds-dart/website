// Copyright (c) 2016, Jimmy Forrester-Fellowes. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/platform/browser.dart';
import 'package:angular2/angular2.dart' show provide;
import 'package:http/browser_client.dart';

import 'package:leeds_dart/components/app/app.component.dart';

main() {
  bootstrap(AppComponent, <dynamic>[
    provide(BrowserClient, useValue: new BrowserClient()),
  ]);
}
