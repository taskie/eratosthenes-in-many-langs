import Control.Monad
import Data.Array.Base
import Data.Array.ST
import Data.Array.Unboxed
import System.Environment

sieve :: Int -> UArray Int Bool
sieve size
    | size <= 1 = listArray (0, size) [False, False]
    | otherwise = runSTUArray $ do
        sieveArray <- newArray (0, size) True
        forM_ [0, 1] $ \i ->
            unsafeWrite sieveArray i False
        let root = ceiling . sqrt $ fromIntegral size
        forM_ [2 .. root] $ \i -> do
            x <- unsafeRead sieveArray i
            when x $ forM_ [i * i, (i * i + i) .. size] $ \j -> do
                unsafeWrite sieveArray j False
        return sieveArray

countPrime :: Int -> Int
countPrime n = length . filter id . elems $ sieve n

main :: IO ()
main = do
    args <- getArgs
    print $ countPrime $ case args of
        (x:_) -> read x
        _ -> 10000000
