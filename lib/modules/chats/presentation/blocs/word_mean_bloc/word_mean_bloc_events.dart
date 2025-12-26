sealed class WordMeanBlocEvents {}

class LoadWordMeaningEvent extends WordMeanBlocEvents {
  final String word;
  LoadWordMeaningEvent(this.word);
}
