{-# LANGUAGE OverloadedStrings #-}
module ShooterSubQueryResult
    ( SubQueryResult
    , SubFile
    , ext
    , link
    , files
    , decodeSubQueryResult
    ) where

import Data.Aeson
import Control.Monad
import Network.URL
import Data.Maybe
import qualified Data.ByteString.Lazy.Char8 as LC
import Control.Applicative

data SubFile =
      SubFile {
        ext :: String
      , link :: String
   } deriving Show

instance FromJSON SubFile where
   parseJSON (Object v) =
    SubFile <$> v .: "Ext"
            <*> v .: "Link"
   parseJSON _ = mzero


data SubQueryResult =
    SubQueryResult {
            desc  :: String
          , delay :: Int
          , files :: [SubFile]
          } deriving Show

instance FromJSON SubQueryResult where
   parseJSON (Object v) =
      SubQueryResult <$> v .: "Desc"
                     <*> v .: "Delay"
                     <*> v .: "Files"
   parseJSON _ = mzero

decodeSubQueryResult :: String -> Either String [SubQueryResult]
decodeSubQueryResult = eitherDecode . LC.pack
