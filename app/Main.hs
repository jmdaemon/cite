{-# LANGUAGE OverloadedStrings #-}
-- For Req Network Library
--{-# LANGUAGE DeriveGeneric     #-}

module Main where

import Lib
import System.Environment
import System.Exit

-- Req Network Get Request
--import Control.Monad
--import Control.Monad.IO.Class
--import Data.Aeson
--import Data.Maybe (fromJust)
--import Data.Monoid ((<>))
--import Data.Text (Text)
--import Data.Text as DataT
--import GHC.Generics
--import Network.HTTP.Req
--import qualified Data.ByteString.Char8 as B
--import qualified Text.URI as URI

--main :: IO ()
--main = runReq defaultHttpConfig $ do
    --args <- liftIO getArgs 
    --let url = DataT.pack $ Prelude.head $ Prelude.take 1 args
    --bs <-
        --req
            --GET
            --(https url)
            ----url
            --NoReqBody
            --bsResponse
            --mempty
    --liftIO $ B.putStrLn (responseBody bs)

-- Wreq Network Get Request
import Network.Wreq
import Control.Lens
import Data.ByteString.Lazy.Char8 as BS

main :: IO ()
main =
    do
        args <- getArgs
        let url = Prelude.head $ Prelude.take 1 args
        response <- get url
        --response <- get take 1 args
        --print (response ^. responseBody)
        --print (response ^. responseBody)
        --Prelude.putStr $ Data.ByteString.Lazy.Char8.unpack $ r ^. responseBody
        --putStr $ BS.unpack $ r ^. responseBody
        Prelude.putStr $ BS.unpack $ response ^. responseBody

        --let url = take 1 args
         --in do
             --response <- get url
             --print (response ^. responseBody)


-- Parse the command line arguments
--parse ["-h"] = usage   >> exit
--parse ["-v"] = version >> exit
--parse []  = getContents

--usage   = putStrLn "Usage: cite [-vh] [urls]"
--version = putStrLn "Haskell cite 0.1.0"
--exit    = exitWith ExitSuccess
--die     = exitWith (ExitFailure 1)
