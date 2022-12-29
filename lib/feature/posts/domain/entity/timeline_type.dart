enum TimelineType { overall, tags, my, subscribe, hot }

TimelineType mapToTimelineType(String value) => TimelineType.values.firstWhere(
      (element) => element.name == value,
      orElse: () => TimelineType.overall,
    );
