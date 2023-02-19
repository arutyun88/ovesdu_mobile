enum MessagesType { private, group, archive }

MessagesType mapToMessagesType(String value) => MessagesType.values.firstWhere(
      (element) => element.name == value,
      orElse: () => MessagesType.private,
    );
