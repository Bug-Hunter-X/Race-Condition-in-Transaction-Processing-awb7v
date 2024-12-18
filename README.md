# Race Condition in Haskell Transaction Processing

This repository demonstrates a race condition in a simple Haskell program that processes financial transactions. The program uses `IORef` to manage account balances, but the implementation fails to handle concurrent access safely, leading to inconsistent and incorrect balances.

The `bug.hs` file contains the flawed implementation. The `bugSolution.hs` file provides a corrected version that uses atomic operations to prevent race conditions.  The solution employs `modifyIORef'` for thread-safe updates.