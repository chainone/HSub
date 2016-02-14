module Main where

import System.Environment
import ShooterFileHash
import ShooterSubQuery

main = do
   (path:_) <- getArgs
   hashString <- fileHash path
   putStrLn $ "The final hash for file " ++ path ++ " is:"
   putStrLn hashString
   testFetch
