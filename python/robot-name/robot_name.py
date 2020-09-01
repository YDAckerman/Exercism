import random as rn
from string import ascii_uppercase as letters
from math import floor

class Robot:

    used_names = {}
    
    def __init__(self):
        new_name = self._genName()
        while(new_name in [k for k,v in Robot.used_names.items() if v == 1]):
            new_name = self._genName()
        Robot.used_names[new_name] = 1
        self.name = new_name

    def reset(self):
        new_name = self.name
        while(new_name in [k for k,v in Robot.used_names.items() if v == 1]):
            new_name = self._genName()
        Robot.used_names[self.name] = 0
        Robot.used_names[new_name] = 1
        self.name = new_name

    def _genName(self):
        prfx = ''.join([rn.sample(letters, 1)[0] for i in range(0,2)])
        sffx = ''.join([str(floor(rn.random() * 10)) for i in range(0,3)])
        return prfx + sffx
