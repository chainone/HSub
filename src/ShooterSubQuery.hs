module ShooterSubQuery
    ( requestSubResult
    ) where

import Network.HTTP
import Network.URL
import Network.URI
import Data.Maybe

shooterURLStringURL :: URL
shooterURLStringURL = fromJust $ importURL "http://www.shooter.cn/api/subapi.php"

shooterQueryList :: String -> String -> [(String, String)]
shooterQueryList fileHash pathInfo = [("filehash", fileHash),
                                      ("pathinfo", pathInfo),
                                      ("format", "json"),
                                      ("lang", "Chn")]


shooterSubRequest ::  [(String, String)] -> Request_String
shooterSubRequest params = postRequest urlString
                           where urlString = exportURL shooterURLStringURL ++ "?" ++ urlEncodeVars params

requestSubResult :: String -> String -> IO String
requestSubResult fileHash pathInfo = do
                              let request = shooterSubRequest $ shooterQueryList fileHash pathInfo
                              -- putStrLn $ show request
                              simpleHTTP request >>= getResponseBody
