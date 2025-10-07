import 'package:portfolio/core/commons/entities/celestial_body.dart';

class StarSystemConfig {
  CelestialBody? selectedBody;
  CelestialBody? hoveredBody;
  bool showUi;
  bool showStar;
  bool showPlanetNames;
  bool showOrbitLine;
  StarSystemConfig({
    this.selectedBody,
    this.hoveredBody,
    this.showUi = true,
    this.showStar = true,
    this.showPlanetNames = true,
    this.showOrbitLine = true,
  });

  static const _undefined = Object();

  StarSystemConfig copyWith({
    Object? selectedBody = _undefined,
    Object? hoveredBody = _undefined,
    bool? showUi,
    bool? showStar,
    bool? showPlanetNames,
    bool? showOrbitLine,
  }) {
    return StarSystemConfig(
      selectedBody: selectedBody == _undefined
          ? this.selectedBody
          : selectedBody as CelestialBody?,
      hoveredBody: hoveredBody == _undefined
          ? this.hoveredBody
          : hoveredBody as CelestialBody?,
      showUi: showUi ?? this.showUi,
      showStar: showStar ?? this.showStar,
      showPlanetNames: showPlanetNames ?? this.showPlanetNames,
      showOrbitLine: showOrbitLine ?? this.showOrbitLine,
    );
  }

  @override
  String toString() {
    return 'StarSystemConfig(selectedBody: $selectedBody, hoveredBody: $hoveredBody, showUi: $showUi, showStar: $showStar, showPlanetNames: $showPlanetNames, showOrbitLine: $showOrbitLine)';
  }

  @override
  bool operator ==(covariant StarSystemConfig other) {
    if (identical(this, other)) return true;

    return other.selectedBody == selectedBody &&
        other.hoveredBody == hoveredBody &&
        other.showUi == showUi &&
        other.showStar == showStar &&
        other.showPlanetNames == showPlanetNames &&
        other.showOrbitLine == showOrbitLine;
  }

  @override
  int get hashCode {
    return selectedBody.hashCode ^
        hoveredBody.hashCode ^
        showUi.hashCode ^
        showStar.hashCode ^
        showPlanetNames.hashCode ^
        showOrbitLine.hashCode;
  }
}
