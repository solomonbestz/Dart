List game_manager_level_update(){
  List change_level = [
    """house""",
    """school"""
    ];
  return change_level;
}

List game_manager_hint_update(){
  List change_hint = [
    """level_one_hint""",
    """level_two_hint"""
  ];
  return change_hint;
}

Map game_manager_levels() {
  var levels = {
    "house": ["chair", "spoon", "table", "cup", "bowl"],
    "school": ["board", "maker", "teacher"]
  };
  return levels;
}

Map game_manager_hints() {
  var hints = {
    "level_one_hint": [
      """The word can be found around.""",
      """The word can be found in a house.""",
      """The word is used everyday."""
    ],
    "level_two_hint": [
      """The word can be found around.""",
      """The word can be found in a school.""",
      """It is used mostly in the school."""
    ]
  };
  return hints;
}
