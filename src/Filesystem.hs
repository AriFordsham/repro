module Filesystem where

import Data.Text (Text)
import Data.Vector (Vector)

import Idem (Idem)

data FSO
  = File Text
  | Directory (Vector FSOEntry)

type FSOEntry = (Text, FSO)

{- | Lazy
 See comment to 'Idem' on why this is a valid 'Idem' action.
-}
readFilesystem :: Text -> Idem s FSOEntry
readFilesystem = undefined