
class SpaceAge:
    def __init__(self, seconds):
        self.earth_age = seconds / 60 / 60 / 24 / 365.25

    def on_earth(self):
        return round(self.earth_age,2)

    def on_mercury(self):
        return round(self.earth_age / 0.2408467,2)

    def on_venus(self):
        return round(self.earth_age / 0.61519726,2)

    def on_mars(self):
        return round(self.earth_age / 1.8808158,2)

    def on_jupiter(self):
        return round(self.earth_age / 11.862615,2)

    def on_saturn(self):
        return round(self.earth_age / 29.447498,2)

    def on_uranus(self):
        return round(self.earth_age / 84.016846,2)

    def on_neptune(self):
        return round(self.earth_age / 164.79132,2)
    


def main():
    print(SpaceAge(1000000000).on_earth())
    pass

if __name__ == "__main__":
    main()
