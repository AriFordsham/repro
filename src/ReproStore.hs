module ReproStore where

import Data.Map.Strict (Map)
import Data.Text (Text)
import Data.Vector (Vector)

import Filesystem (FSO)
import Idem (Idem)

-- | Opaque type
newtype StorePath s = StorePath Text

pathAsString :: StorePath s -> Text
pathAsString = undefined

pathAlreadyExists :: Text -> Idem s (Maybe (StorePath s))
pathAlreadyExists = undefined

addToStore :: FSO -> Vector (StorePath s) -> Text -> Idem s (StorePath s)
addToStore = undefined

data Derivation s = Derivation
  { attributes :: Map String String
  , drvPath :: StorePath s
  , outPath :: StorePath s
  }

derivation :: Map String String -> Idem s (Derivation s)
derivation = undefined

buildDerivation :: StorePath s -> Idem s ()
buildDerivation = undefined