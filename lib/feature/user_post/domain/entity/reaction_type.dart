enum ReactionType { none, like, dislike }

ReactionType mapToReactionType(String value) => ReactionType.values.firstWhere(
      (element) => element.name == value,
      orElse: () => ReactionType.none,
    );
