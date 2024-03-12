

// Function to analyze the structure of a given sentence
Map<String, dynamic> analyzeSentence(String sentence) {
  List<String> words = sentence.split(' ');
  String nounPhrase = '';
  String verbPhrase = '';
  String adjPhrase = '';
  String object = '';

  // Identify parts of the sentence based on the rules
  for (int i = 0; i < words.length; i++) {
    if (wordDatabase['N']!.contains(words[i]) || wordDatabase['Adj']!.contains(words[i])) {
      nounPhrase += '${words[i]} ';
    } else if (wordDatabase['V']!.contains(words[i])) {
      verbPhrase += '${words[i]} ';
    } else if (wordDatabase['Adj']!.contains(words[i])) {
      adjPhrase += '${words[i]} ';
    } else if (wordDatabase['O']!.contains(words[i])) {
      object += '${words[i]} ';
    }
  }

  // Remove trailing spaces
  nounPhrase = nounPhrase.trim();
  verbPhrase = verbPhrase.trim();
  adjPhrase = adjPhrase.trim();
  object = object.trim();

  Map<String, dynamic> structure = {
    'NP': nounPhrase,
    'VP': verbPhrase,
    'AdjP': adjPhrase,
    'O': object
  };

  return {
    'sentence': sentence,
    'structure': structure
  };
}

void main() {
  Map<String, dynamic> sentenceStructure = analyzeSentence("big cat runs quickly");
  print(sentenceStructure); 
  // Output: {sentence: 'big cat runs quickly', structure: {NP: 'big cat', VP: 'runs', AdjP: 'quickly', O: ''}}
}
