module SpaceAge (Planet(..), ageOn) where


data Planet = Mercury | Venus | Earth | Mars | Jupiter | Saturn | Uranus | Neptune

toOrbit :: Planet -> Float
toOrbit Mercury = 0.2408467
toOrbit Venus = 0.61519726
toOrbit Earth = 1.0
toOrbit Mars =  1.8808158
toOrbit Jupiter = 11.862615
toOrbit Saturn = 29.447498
toOrbit Uranus = 84.016846
toOrbit Neptune = 164.79132

ageOn :: Planet -> Float -> Float
ageOn planet seconds =  seconds / 31557600 / (toOrbit planet)


