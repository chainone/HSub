module Main where

import System.Environment
import ShooterFileHash

main = do
   (path:_) <- getArgs
   hashString <- fileHash path
   putStrLn $ "The final hash for file " ++ path ++ " is:"
   putStrLn hashString
