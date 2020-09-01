module Clock (addDelta, fromHourMin, toString) where

data Clock = Clock Int Int deriving (Eq)

fromHourMin :: Int -> Int -> Clock
fromHourMin hour min = Clock hrs mins
  where
    tot_m = 1440 + (hour * 60 + min)
    mins = tot_m `mod` 60
    hrs = ((tot_m - mins) `quot` 60) `mod` 24
    
toString :: Clock -> String
toString clock = hour_str ++ ":" ++ min_str
  where
    hour = show $ getHour clock
    hour_str = if length hour == 2 then hour else "0" ++ hour
    min = show $ getMin clock
    min_str = if length min == 2 then min else "0" ++ min
    
getHour :: Clock -> Int
getHour (Clock x _) = x

getMin :: Clock -> Int
getMin (Clock _ y) = y

addDelta :: Int -> Int -> Clock -> Clock
addDelta hour min clock = fromHourMin 0 new_tot_m
  where
    delta_m = hour * 60 + min
    clock_m = (getHour clock) * 60 + getMin clock
    new_tot_m = clock_m + delta_m


