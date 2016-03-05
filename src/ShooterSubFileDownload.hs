module ShooterSubFileDownload
    (
      collectSubFiles
    ) where

import ShooterSubQueryResult
import Network.URL

-- collectSubFilesFromOneResult :: SubQueryResult -> [(String, URL)]

collectSubFiles :: [SubQueryResult] -> [SubFile]
collectSubFiles r = r >>= files
