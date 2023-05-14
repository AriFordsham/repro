module Idem (Idem, runIdem, guaranteeIdempotent) where

import Control.Selective (Selective)

{- | Monad of idempotent effects.

 Law: f <$> u <*> u = (\x -> f x x) <$> u (See https://duplode.github.io/posts/idempotent-applicatives-parametricity-and-a-puzzle.html)

 The intention is to be 'morally lawful'.

 In particular:

 * The guarantee is that no non-idempotent actions will be allowed to run.
    Actions may fail if they would break idempotence. Use regular IO exceptions
    for this.

  * We subscribe to the "filesystem stability fallacy" - the fallacy that the
    filesystem will not change while the program is running. So for example, if
    the filesystem changes while lazy IO is in operation, the returned object
    need not represent the state of the filesystem at any given time.

  The phantom type parameter is to prevent objects such as 'StorePath' from
  escaping the 'Idem' monad.
-}
newtype Idem s a = Idem (IO a)
  deriving (Functor, Applicative, Selective, Monad) via IO

runIdem :: (forall s. Idem s a) -> IO a
runIdem (Idem m) = m

guaranteeIdempotent :: IO a -> Idem s a
guaranteeIdempotent = Idem