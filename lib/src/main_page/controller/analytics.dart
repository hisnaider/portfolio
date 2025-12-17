import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

const String _webSiteId = '0657c781-d8b1-48bd-b114-d64d37111291';
const String _hostName = 'localhost';

//urls
const String _scrollSection = 'Scroll Section';
const String _systemStar = 'System Star';

class Analytics {
  static Analytics? _instance;
  static Analytics get instance {
    _instance ??= Analytics._();
    return _instance!;
  }

  Analytics._();

  late final Dio _client;
  late final TargetPlatform _platform;
  bool _initialized = false;

  TargetPlatform get getPlatform => _platform;

  void init(TargetPlatform platform) {
    if (_initialized) return;
    _platform = platform;
    _client = Dio();
    _initialized = true;
  }

  //Scroll Section
  void getScrollEvent({required double speed}) {
    final Map<String, String> property = {
      "speed": _getScrollSpeedCategory(speed),
      "device": _platform.name,
    };
    _request(
      eventName: speed > 0 ? 'scroll_down' : 'scroll_up',
      url: _scrollSection,
      property: property,
    );
  }

  void getSectionReachedEvent({required String section}) {
    _request(
      eventName: 'section_reached',
      url: _scrollSection,
      property: {'section:': section},
    );
  }

  void getRecommendationReadEvent({required String name}) {
    _request(
      eventName: 'recommendation_read',
      url: _scrollSection,
      property: {'name:': name},
    );
  }

  void getTransitionFinishedEvent() {
    _request(
      eventName: 'transition_finished',
      url: _scrollSection,
    );
  }

  //System Star
  void getCloseIntroductionModalEvent() {
    _request(
      eventName: 'introduction_modal_closed',
      url: _systemStar,
    );
  }

  void getInteractionsEvent(
      {required String event, required String? planetUnderCursos}) {
    _request(
      eventName: event,
      url: _systemStar,
      property: {
        "planet_under_cursor": planetUnderCursos ?? "none",
        "device": _platform.name,
      },
    );
  }

  void getSimulationChangeEvent({required double speed}) {
    _request(
        eventName: 'simulation_speed_change',
        url: _systemStar,
        property: {"value": '${speed}x'});
  }

  void getTogglesEvent({required String action}) {
    _request(
      eventName: action,
      url: _systemStar,
    );
  }

  void getPlanetEvent(
      {required String action,
      required String planet,
      String? image,
      String? link}) {
    _request(
      eventName: action,
      url: _systemStar,
      property: {
        'planet': planet,
        if (image != null) 'image': image,
        if (link != null) 'link': link,
      },
    );
  }

  void getOpenContactEvent() {
    _request(
      eventName: 'contact_opened',
      url: _systemStar,
    );
  }

  void getContactLinkClickedEvent({required String link}) {
    _request(
      eventName: 'contact_link_clicked',
      url: _systemStar,
      property: {
        'link': link,
      },
    );
  }

  void getOpenTutorialEvent() {
    _request(
      eventName: 'tutorial_opened',
      url: _systemStar,
    );
  }

  void _request({
    required String eventName,
    required String url,
    Map<String, String>? property,
  }) {
    _client.post('https://cloud.umami.is/api/send',
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
        data: {
          "type": "event",
          "payload": {
            "website": _webSiteId,
            "name": eventName,
            "url": url,
            "hostname": _hostName,
            if (property != null) "data": property,
          }
        });
  }

  String _getScrollSpeedCategory(double value) {
    final speed = value.abs();

    if (speed <= 100) {
      return 'slow';
    } else if (speed <= 400) {
      return 'normal';
    } else if (speed <= 600) {
      return 'fast';
    } else {
      return 'very_fast';
    }
  }
}
