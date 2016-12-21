// Copyright (c) 2016, Jimmy Forrester-Fellowes. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:convert' show UTF8, JSON, AsciiCodec;

import 'dart:html';

import 'package:angular2/core.dart';
import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:angular2_components/angular2_components.dart';
import 'package:angular2/platform/common.dart' show LocationStrategy, HashLocationStrategy;

import 'package:jsonp/jsonp.dart' as jsonp;


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

  List tweets = [];

  ngOnInit () {
    print ("init...");
    fetchTweets();
  }

  Future<List> fetchTweets () async {

        jsonp.fetch(
          uri: "https://syndication.twitter.com/timeline/profile?dnt=false&screen_name=leeds_dart&suppress_response_codes=true&lang=en&rnd=1234&callback=?" )
          .then((data) {

            Element tweetsRaw = new Element.html(data['body']);
            tweets = [];

            // itterate over the tweets
            tweetsRaw.querySelector('.timeline-Body .timeline-Viewport .timeline-TweetList').children.forEach((Element tweetRaw) {
              Map tweet = {
                'body': '...',
                'date': '...'
              };
              tweetRaw.querySelector('.timeline-Tweet').children.forEach((Element el) {

                // debugging the dom walking
                // print ("ELEMENT: "+el.tagName+" "+el.classes.join(', '));
                // print (el.innerHtml);

                if (el.classes.contains('timeline-Tweet-text')) {
                  tweet['body'] = el.text;
                }
                if (el.classes.contains('timeline-Tweet-metadata')) {
                  tweet['date'] = (el.querySelector('.dt-updated').firstChild);

                  //if (tweet['date'] != 0) tweet['date'] = "$tweet[date] minutes ago";
                }

              });
              tweets.add(tweet);
            });
            print(tweets);
          })
          .catchError((e) {
              throw e;
              document.querySelector('#twitter-container')
              .setInnerHtml('Could not connect to Twitter');
          });


  }

}
