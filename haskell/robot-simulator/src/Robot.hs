module Robot
    ( Bearing(East,North,South,West)
    , bearing
    , coordinates
    , mkRobot
    , move
    ) where

data Bearing = North
             | East
             | South
             | West
             deriving (Eq, Show)

data Robot = Robot (Integer, Integer) Bearing

bearing :: Robot -> Bearing
bearing (Robot _ b) = b

coordinates :: Robot -> (Integer, Integer)
coordinates (Robot p _) = p

b2c :: Bearing -> (Integer, Integer)
b2c North = (0, 1)
b2c East = (1, 0)
b2c South = (0, -1)
b2c West = (-1, 0)

mkRobot :: Bearing -> (Integer, Integer) -> Robot
mkRobot direction coordinates = Robot coordinates direction
move :: Robot -> String -> Robot
move robot [] = robot
move robot ('R':xs) = move (turnR robot) xs
move robot ('L':xs) = move (turnL robot) xs
move (Robot (x,y) b) ('A':xs) = move (Robot (x+dx, y+dy) b) xs
  where
    (dx, dy) = b2c b

turnL :: Robot -> Robot
turnL (Robot p North) = (Robot p West) 
turnL (Robot p East) = (Robot p North) 
turnL (Robot p South) = (Robot p East) 
turnL (Robot p West) = (Robot p South) 

turnR :: Robot -> Robot
turnR (Robot p North) =  Robot p East
turnR (Robot p East)  =  Robot p South
turnR (Robot p South) =  Robot p West
turnR (Robot p West)  =  Robot p North


