module ShooterFileHash
    ( fileHash
    ) where

import System.IO
import Data.Digest.Pure.MD5
import Data.List
import qualified Data.ByteString.Lazy as L
import Control.Monad

sampleLen = 4 * 1024

offsets :: Integer -> Maybe [Integer]
offsets size
         | size < 8 * 1024 = Nothing
         | otherwise = Just [4*1024, (div size 3) * 2, div size 3, size-(8*1024)]

sampleHash :: Handle -> Integer -> IO MD5Digest
sampleHash h offset = do
      hSeek h AbsoluteSeek offset
      md5 <$> L.hGet h sampleLen

allSampleHash :: Handle -> Integer -> IO [MD5Digest]
allSampleHash h size = case offsets size of Nothing -> error "The file size must be larger than 8 KB"
                                            Just os -> sequence $ fmap (sampleHash h) os


fileHash :: FilePath -> IO String
fileHash path = withFile path ReadMode (\h -> (intercalate ";" . fmap show) <$> (join $ allSampleHash h <$> hFileSize h))
