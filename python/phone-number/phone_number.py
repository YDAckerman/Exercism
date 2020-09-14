import re

class PhoneNumber:
    def __init__(self, number):
        new_num = re.sub("[^0-9]", "", number)
        if re.search("[2-9]\d{2}[2-9]\d{6}", new_num) is not None:
            if len(new_num) > 10:
                if len(new_num) == 11 and new_num[0] == "1":
                    new_num = new_num[1:]
                else :
                    raise ValueError("invalid number")
                    
            self.area_code = new_num[0:3]
            self.local = new_num[3:6] + "-" + new_num[6:]
            self.number = new_num
            
        else:
            raise ValueError("invalid number")
        
    def pretty(self):
        ac_num = self.area_code
        loc_num = self.local
        return f"({self.area_code})-{self.local}"


def main():
    print(PhoneNumber("12234567890").number)

if __name__ == '__main__':
    main()
