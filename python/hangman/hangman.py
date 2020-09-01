# Game status categories
# Change the values as you see fit
STATUS_WIN = "win"
STATUS_LOSE = "lose"
STATUS_ONGOING = "ongoing"


class Hangman:

    def __init__(self, word):
        self.remaining_guesses = 9
        self.status = STATUS_ONGOING
        self.word = word
        self.unmasked_letters = []

    def guess(self, char):

        if self.status is not STATUS_ONGOING:
            raise ValueError("The game is over!")
        
        if char in self.word and char not in self.unmasked_letters:
            self.unmasked_letters.append(char)
        else:
            self.remaining_guesses -= 1

        self.set_status()

    def set_status(self):
        
        letters_found = [l in self.unmasked_letters for l in self.word]
        if self.remaining_guesses < 0 and not all(letters_found):
            self.status = STATUS_LOSE
        elif self.remaining_guesses >= 0 and all(letters_found) :
            self.status = STATUS_WIN
        else :
            self.status = STATUS_ONGOING
        
    def get_masked_word(self):
        masked_word = ''
        for l in self.word:
            if l in self.unmasked_letters:
                masked_word += l
            else:
                masked_word += '_'
        return masked_word

    def get_status(self):
        return self.status


def main():
    game = Hangman('foo')
    print(game.remaining_guesses)
    for i in range(10):
        game.guess('x')
        print(game.remaining_guesses)
        print(game.get_status())
    
if __name__ == "__main__":
    main()
