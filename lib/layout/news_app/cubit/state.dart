abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsChangeBottomNavState extends NewsStates {}

class NewsbusinessloadingState extends NewsStates {}

class NewsgetbusinesssuccessState extends NewsStates {}

class NewsgetbusinesserrorState extends NewsStates {
  final String error;

  NewsgetbusinesserrorState(this.error);
}


class NewssportsloadingState extends NewsStates {}

class NewsgetsportssuccessState extends NewsStates {}

class NewsgetsportserrorState extends NewsStates {
  final String error;

  NewsgetsportserrorState(this.error);
}



class NewsscienceloadingState extends NewsStates {}

class NewsgetsciencesuccessState extends NewsStates {}

class NewsgetscienceerrorState extends NewsStates {
  final String error;

  NewsgetscienceerrorState(this.error);
}
