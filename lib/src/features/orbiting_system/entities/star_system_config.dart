// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:portfolio/core/commons/entities/celestial_body.dart';

class StarSystemConfig {
  CelestialBody? selectedBody;
  CelestialBody? hoveredBody;
  bool showUi;
  bool showSelectionIndicator;
  bool showPlanetNames;
  bool showOrbitLine;
  bool showContact;
  double simulationSpeed;
  StarSystemConfig({
    this.selectedBody,
    this.hoveredBody,
    this.showUi = true,
    this.showSelectionIndicator = true,
    this.showPlanetNames = true,
    this.showOrbitLine = true,
    this.showContact = false,
    this.simulationSpeed = 1,
  });

  static const _undefined = Object();

  StarSystemConfig copyWith({
    Object? selectedBody = _undefined,
    Object? hoveredBody = _undefined,
    bool? showUi,
    bool? showSelectionIndicator,
    bool? showPlanetNames,
    bool? showOrbitLine,
    bool? showContact,
    double? simulationSpeed,
  }) {
    return StarSystemConfig(
      selectedBody: selectedBody == _undefined
          ? this.selectedBody
          : selectedBody as CelestialBody?,
      hoveredBody: hoveredBody == _undefined
          ? this.hoveredBody
          : hoveredBody as CelestialBody?,
      showUi: showUi ?? this.showUi,
      showSelectionIndicator:
          showSelectionIndicator ?? this.showSelectionIndicator,
      showPlanetNames: showPlanetNames ?? this.showPlanetNames,
      showOrbitLine: showOrbitLine ?? this.showOrbitLine,
      showContact: showContact ?? this.showContact,
      simulationSpeed: simulationSpeed ?? this.simulationSpeed,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StarSystemConfig &&
        other.selectedBody == selectedBody &&
        other.hoveredBody == hoveredBody &&
        other.showUi == showUi &&
        other.showSelectionIndicator == showSelectionIndicator &&
        other.showPlanetNames == showPlanetNames &&
        other.showOrbitLine == showOrbitLine &&
        other.showContact == showContact &&
        other.simulationSpeed == simulationSpeed;
  }

  @override
  int get hashCode {
    return selectedBody.hashCode ^
        hoveredBody.hashCode ^
        showUi.hashCode ^
        showSelectionIndicator.hashCode ^
        showPlanetNames.hashCode ^
        showOrbitLine.hashCode ^
        showContact.hashCode ^
        simulationSpeed.hashCode;
  }

  @override
  String toString() {
    return 'StarSystemConfig(selectedBody: $selectedBody, hoveredBody: $hoveredBody, showUi: $showUi, showSelectionIndicator: $showSelectionIndicator, showPlanetNames: $showPlanetNames, showOrbitLine: $showOrbitLine, showContact: $showContact, simulationSpeed: $simulationSpeed)';
  }
}
