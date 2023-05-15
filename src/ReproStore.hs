module ReproStore where

import Data.Map.Strict (Map)
import Data.Set (Set)
import Data.Text (Text)
import Data.Vector (Vector)

import Filesystem (FSO)
import Idem (Idem)

-- | Opaque type
newtype StorePath s = StorePath Text

newtype StoreDerivation s = StoreDerivation Text

pathAsString :: StorePath s -> Text
pathAsString = undefined

pathAlreadyExists :: Text -> Idem s (Maybe (StorePath s))
pathAlreadyExists = undefined

addToStore :: FSO -> Vector (StorePath s) -> Text -> Idem s (StorePath s)
addToStore = undefined

data EnvVal s
  = EnvValLit Text
  | EnvValPath (StorePath s)

data DerivationSpecification s = DerivationSpecification
  { system :: Text
  , builder :: StorePath s
  , environment :: Map Text (EnvVal s)
  , args :: Vector (EnvVal s)
  , outputs :: Set Text
  , inputDrvs :: Map (StoreDerivation s) (Vector Text)
  , inputSrcs :: Set (StorePath s)
  }

instantiate :: DerivationSpecification s -> Idem s (StoreDerivation s)
instantiate = undefined

derivationSpecification ::
  StoreDerivation s ->
  Idem s (DerivationSpecification s)
derivationSpecification = undefined

{- | A 'StorePath' may only be constructed if it exists in the store. Since a
 derivation might not be realised, you have two options for obtaining the
 output paths (which can already be calculated):

 * As strings (for possible later passing to 'pathAlreadyExists')

 * As 'Maybe (StorePath s)'s, which will be 'Nothing' if the derivation is not
   realised.
-}
derivationOutputsUnrealised :: StoreDerivation s -> Idem s (Map Text Text)
derivationOutputsUnrealised = undefined

derivationOutputsRealised ::
  StoreDerivation s ->
  Idem s (Maybe (Map Text (StorePath s)))
derivationOutputsRealised = undefined

build :: StoreDerivation s -> Idem s (Map Text (StorePath s))
build = undefined