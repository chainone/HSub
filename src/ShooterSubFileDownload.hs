module ShooterSubFileDownload
    ( downloadSubFiles
    ) where

import ShooterSubQueryResult
import Network.URL
import Network.URI
import Network.HTTP
import Network.HTTP.Headers
import Network.Stream
import Data.List
import System.IO
import Control.Monad
import Data.Maybe
import qualified Data.ByteString as DB

httpsString = "https://"

replaceHttpsWithHttp :: String -> String
replaceHttpsWithHttp s = case stripPrefix httpsString s of Just xs -> "http://" ++ xs
                                                           Nothing -> s
                                                           
collectSubFiles :: [SubQueryResult] -> [SubFile]
collectSubFiles r = r >>= files

getFileName :: Response ty -> Maybe String
getFileName = stripPrefix "attachment; filename=" <=< findHeader (HdrCustom "Content-Disposition")

saveResponseAsFile :: String -> Response DB.ByteString -> IO ()
saveResponseAsFile dfn rsp = do
   let fn = fromMaybe dfn $ getFileName rsp
   DB.writeFile fn $ rspBody rsp
   putStrLn $ "Downloaded sub file: " ++ fn

downloadSubFile :: String -> SubFile -> IO ()
downloadSubFile dfn f =  do
   responseResult <- (simpleHTTP . defaultGETRequest_ . fromJust . parseURI . replaceHttpsWithHttp .link) f :: IO (Result (Response DB.ByteString))
   let defaultFileName = dfn ++ "." ++ ext f
   case responseResult of Right rsp -> saveResponseAsFile defaultFileName rsp
                          Left error -> putStrLn $ "Error downloading sub file: " ++ defaultFileName ++ "error: " ++ show error


downloadSubFiles :: String -> [SubQueryResult] -> IO ()
downloadSubFiles dfn qrs = do
         let subfiles = collectSubFiles qrs
         putStrLn $ "Matched " ++ (show . length) subfiles ++ " subtitles on server"
         putStrLn "downloading subtitle files..."
         mapM_ (downloadSubFile dfn) subfiles
