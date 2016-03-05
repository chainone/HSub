module Main where

import System.Environment
import ShooterFileHash
import ShooterSubQuery
import ShooterSubFileDownload

main = do
   (path:_) <- getArgs
   hashString <- fileHash path
   -- putStrLn $ "The final hash for file " ++ path ++ " is:" ++ hashString

   rets <- requestSubResult hashString path
   case rets of Right queryResults -> mapM_ (putStrLn . show) $ collectSubFiles queryResults
                Left errorMessage -> putStrLn errorMessage
