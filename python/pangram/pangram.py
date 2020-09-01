from string import ascii_lowercase as letters

def is_pangram(sentence):
    sentence = sentence.lower()
    return(all([(letter in sentence) for letter in letters]))
