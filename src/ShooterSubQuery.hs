module ShooterSubQuery
    ( testFetch
    ) where

import Network.HTTP

testFetch :: IO ()
testFetch = simpleHTTP (getRequest "http://www.baidu.com") >>= getResponseBody >>= putStrLn
