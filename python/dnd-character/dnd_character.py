import random
from math import floor

def modifier(n):
    return floor((n - 10)/2)

class Character:
    def __init__(self):
        self.strength = self.__roll()
        self.dexterity = self.__roll()
        self.constitution = self.__roll()
        self.intelligence = self.__roll()
        self.wisdom = self.__roll()
        self.charisma = self.__roll()
        self.hitpoints = 10 + modifier(self.constitution)

    def ability(self):
        return random.sample([self.strength, self.dexterity, self. constitution,
                       self.intelligence, self.wisdom, self.charisma], 1)[0]
        
    def __roll(self):
        rolls = random.sample(range(1,7), 4)
        rolls.sort()
        return sum(rolls[1:])
        

