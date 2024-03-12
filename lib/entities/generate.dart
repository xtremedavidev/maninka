

import 'dart:math';

// Sample pseudo database
Map<String, List<String>> wordDatabase = {
  'frt': ['banana', 'apple', 'orange', 'mango'],
  'num': ['one', 'two', 'three', 'four'],
  'clr': ['red', 'blue', 'green', 'yellow'],
  'mnr': ['quickly', 'slowly', 'carefully', 'loudly'],
  'grt': ['hello', 'goodbye', 'welcome', 'thank you'],
  'N': ['dog', 'cat', 'bird', 'tree'],
  'V': ['runs', 'eats', 'flies', 'grows'],
  'Adj': ['big', 'small', 'happy', 'sad']
};

// Function to generate a sentence with specified order
Map<String, dynamic> generateSentence() {
  List<String> sentenceStructure = ['NP', 'VP']; // Noun Phrase, Verb Phrase
  String sentence = '';
  sentenceStructure.forEach((part) {
    sentence += generatePart(part) + ' ';
  });
  sentence = sentence.trim();

  return {
    'sentence': sentence,
    'structure': sentenceStructure.join(', ')
  };
}

// Function to generate a part of the sentence based on the given structure
String generatePart(String structure) {
  switch (structure) {
    case 'NP':
      return generateNounPhrase();
    case 'VP':
      return generateVerbPhrase();
    default:
      return '';
  }
}

// Function to generate a Noun Phrase
String generateNounPhrase() {
  String noun = getRandomWord('N');
  String adjPhrase = generateAdjectivePhrase();
  return adjPhrase != '' ? '$adjPhrase $noun' : noun;
}

// Function to generate a Verb Phrase
String generateVerbPhrase() {
  String verb = getRandomWord('V');
  return verb;
}

// Function to generate an Adjective Phrase
String generateAdjectivePhrase() {
  String adjective = getRandomWord('Adj');
  return adjective;
}

// Function to get a random word from a given category
String getRandomWord(String category) {
  List<String> words = wordDatabase[category]!;
  int randomIndex = Random().nextInt(words.length);
  return words[randomIndex];
}

void main() {
  Map<String, dynamic> sentenceData = generateSentence();
  print(sentenceData); // Output: e.g., {sentence: "big cat runs", structure: "NP, VP"}
}
