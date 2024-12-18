```haskell
import Control.Concurrent.MVar
import Control.Monad

-- Use MVar for atomic balance updates
newtype Account = Account (MVar Int)

newAccount :: Int -> IO Account
newAccount initialBalance = Account <$> newMVar initialBalance

processTransaction :: Account -> Int -> IO ()
processTransaction (Account mvar) amount = do
  modifyMVar mvar ("balance" -> return (balance + amount, ())) 

main :: IO ()
main = do
  account <- newAccount 100
  forkIO $ processTransaction account 50
  forkIO $ processTransaction account -25
  processTransaction account 20
  balance <- readMVar (getAccount mvar)
  print balance

```